---
name: blender
description: Build, edit, animate and render 3D content in Blender with Python (bpy), usually headless. Covers modeling objects and assemblies from a description or reference image, recreating a photographed scene, laying out environments from a tabletop to a landscape or city, animation (keyframes, paths, physics, camera moves), lighting, materials and still or video renders, each checked with renders. Use whenever a task involves Blender, bpy, a .blend file, 3D modeling, a procedural 3D scene, or rendering a 3D image or animation.
---

# Blender 3D work with Python

Deliver what was asked (renders, video, `.blend`, exports) from **one rebuildable build script**, check it by looking at renders, and say plainly what still differs from the brief or reference.

Explicit task requirements (paths, resolution, engine, samples, frame range, background, style) override every default in this skill.

## 0. Start (first few minutes)

- Probe once: `blender --version`, whether a GPU exists, and whether Blender's own Python has numpy (`blender -b --python-expr "import numpy"`). Distro packages (apt) often lack numpy and OpenImageDenoise; the helpers work without both, but your own scripts must not assume them. Note the time budget, if any.
- Always run Blender as:
  `blender -b --factory-startup --python-exit-code 1 -P build.py -- <args>`.
  Without `--python-exit-code 1`, a Python exception still exits 0 and looks like success.
- Use the helper library instead of re-deriving version-sensitive boilerplate:
  ```python
  import sys; sys.path.insert(0, "<skill-dir>/scripts")   # skill-dir is given with this skill
  import bpy_helpers as H
  ```
  The API below is enough to start; read `scripts/bpy_helpers.py` only for details. Angles are in degrees, sizes in metres, hex colours sRGB. Every shape takes `location=, rotation=, mat=, collection=`.
  ```text
  reset_scene()
  material_preset(name, kind, base_color=None, scale=1.0, **principled)   # kinds: plastic glossy_plastic rubber
      ceramic car_paint chrome steel brushed_metal aluminum gold brass copper painted_metal glass frosted_glass
      water wood leather fabric concrete stone foliage; scale≈10 for a 10 cm prop
  material(name, base_color, roughness=0.5, metallic=0.0, **principled)  # principled: transmission ior coat
      coat_roughness sheen subsurface specular emission emission_strength alpha anisotropic
  add_noise_variation(mat, scale=8, amount=0.15, roughness_amount=0.1, bump=0)   emission_material(name, color, strength)
  add_box(name, size=(x,y,z), bevel=0)        add_cylinder(name, radius, depth, radius_top=None, vertices=64, bevel=0)
  add_cone(name, radius, depth)               add_sphere(name, radius, scale=(1,1,1))
  add_torus(name, major, minor)               add_plane(name, size)
  add_lathe(name, [(r, z), ...], segments=64, thickness=0)        # revolve profile around Z
  add_extrusion(name, [(x, y), ...], depth, bevel=0)             # 2D outline in XY, extruded along Z
  add_tube(name, [(x, y, z), ...], radius, closed=False, smooth_path=True, taper=None)
  add_text(name, body, size, extrude)         shade_smooth(obj, angle=35)
  add_modifier(obj, "SUBSURF"|"ARRAY"|"MIRROR"|"SOLIDIFY"|"BEVEL"..., **props)
  boolean(target, cutter, "DIFFERENCE"|"UNION"|"INTERSECT")    apply_modifiers(obj)    join([objs], name)
  instance(src, name, ...)                    collection(name)    collection_instance(col, name, ..., scale=1)
  radial_array(src, count, radius=0, center=(0,0,0), axis="Z")   # bolts, spokes, keys, ticks, columns
  add_wheel(name, radius, width, location, spokes=5, tread=0)    # tyre+rim+hub(+spokes/tread), axle = local X
  parent(child, parent_obj, keep_transform=True)  # False: child's location is an offset on a moving rig
  bbox(objs) -> (min, max)    dimensions(objs)    place_on(obj, z=0)
  ground_contacts(objects=None, ground_z=0)      report()            # sizes, lowest z, polygon counts
  add_camera(name, location, target, lens=50) frame_objects(cam, objs, azimuth=35, elevation=20, margin=1.12)
  look_at(obj, target)                        add_light("AREA"|"POINT"|"SPOT"|"SUN", name, location, target, energy, size)
  studio_lighting(target=objs, key_azimuth=-40, key_elevation=45, intensity=1, contrast=0.6, softness=0.5)
  sun_and_sky(elevation=35, azimuth=150)      hdri_world(path)    world_color(hex, strength)    volume_fog(density≈0.1/view_distance, size=, center=)
  set_render(engine="CYCLES", resolution=(w,h), samples=64, percentage=100, view_transform="AgX"|"Standard"|
      "Khronos PBR Neutral", look=None, transparent=False, motion_blur=False)    # denoises only when the build can
  render_still(path, background=None)         save_blend(path)    # background="#FFFFFF": transparent film, flattened
  set_frames(start, end, fps)                 key(obj, frame, location=, rotation=, scale=, **data_props)
  set_interpolation(obj, "BEZIER"|"LINEAR"|"CONSTANT", easing=None, extrapolation=None|"CYCLES")
  follow_path(obj, [(x, y, z), ...], frames=(1, 120), closed=False)    track_to(obj, target)    fcurves(obj)
  rigid_body(obj, "ACTIVE"|"PASSIVE", mass=1)  bake_physics(frame_end)    render_animation(out_dir, video=False)
  ```
- Review tools:
  - `scripts/contact_sheet.py` renders several views and/or frames into one image;
  - `scripts/zoom.py` enlarges crops of any image (reference or render) so small details can be read;
  - `scripts/ref_check.py` measures a render against a reference of the same object: silhouette overlap, size, proportions, offset and colour, with an overlay;
  - `scripts/motion_check.py` steps an animation frame by frame and reports pops, sinking and objects leaving the view.

## 1. Pick the track and read only its reference

| The task is mainly… | Read |
|---|---|
| One object, product or machine, from text or from a reference image of the object | [object-modeling.md](references/object-modeling.md) |
| Matching a photo, painting or render of a **scene** through its camera (layout, perspective, light, look) | [image-reconstruction.md](references/image-reconstruction.md) (it links its own references and scripts) |
| Motion: keyframed animation, vehicles on paths, physics, turntables, fly-throughs, video output | [animation.md](references/animation.md) |
| A large or grand scene: landscape, city, forest, interior, crowds, epic scale | [environments.md](references/environments.md) |
| Editing an existing `.blend` | Inspect it first (`H.report()`, cameras, frame range, materials), then change only what was asked, then re-render |

Tracks combine: "a train crossing a bridge in a mountain valley at sunset" is an Object, Environment and Animation task. Read [bpy-pitfalls.md](references/bpy-pitfalls.md) when anything errors or renders unexpectedly. [lighting-and-color.md](references/lighting-and-color.md) and [construction-patterns.md](references/construction-patterns.md) go deeper when needed.

## 2. The workflow (every track)

**Plan → block out → first complete deliverable → improve in rounds → finish.**

1. **Plan in a few lines.** No long documents.
   - List the parts and their real-world sizes in metres.
   - Say how they relate: what sits on, attaches to, or repeats along what.
   - Give materials per part, camera (lens, view direction, framing), lighting, and the output spec.
   - With a reference image, record what is visible:
     - the overall silhouette and aspect ratio;
     - proportions as ratios between parts, measured from the image;
     - counts of repeated parts (wheels, windows, keys, legs);
     - colour and finish per part;
     - the view angle and lens feel;
     - where the light comes from;
     - the background and shadows.
2. **Block out.** Use primitives at true scale and frame the camera. Render small (about 25–50% resolution, 8–16 samples). Fix proportions, placement and composition now, while it is cheap.
3. **Produce the complete deliverable early.** When roughly a quarter of the time budget is spent, every required output should exist: the render at the requested path and size, the `.blend`, and video if asked. From then on, every round only improves a working result.
   - Re-render and re-save from the same build, so the outputs never disagree.
   - Write candidate renders to a separate path and replace the deliverable only when the new render is better.
4. **Improve in rounds.** Each round:
   - Render.
   - Look at the image with the image viewer (`read_file`), next to the reference or brief.
   - Name the **single most visible difference** and fix its cause in the script, in this order:
     1. missing or wrong parts, or a wrong silhouette;
     2. proportions and placement;
     3. camera and framing;
     4. light and exposure;
     5. colour and materials;
     6. small details.
   - Rebuild. If the result is worse, revert.
   - Every few rounds, check other angles with `contact_sheet.py`. Floating parts, parts buried inside others, wrong depth and missing back sides are invisible from the main camera.
   - **Detail pass.** Once silhouette, proportions, light and colours agree, details become the largest remaining gap. For a reference image:
     - Zoom into it: `blender -b --python-exit-code 1 -P <skill-dir>/scripts/zoom.py -- --image ref.jpg --out /tmp/zoom.png --grid 2x2`, or `--box x0,y0,x1,y1`.
     - List the small recognizable features you see: wheel rims and spokes, treads, vents, seams, fasteners, dial markings, handles, mirrors, cables, labels, repeated keys or slats.
     - Add them in order of visual size, checking each one is visible at the output size. Recipes are in object-modeling.md.
5. **Finish.** See section 7.

**Time.** Time the first preview render and extrapolate before you choose final samples or resolution. With a fixed budget, stop starting large changes at about 80% of it and spend the rest on the final render, saving and checking the outputs. An unfinished improvement is worth less than a finished deliverable. With no stated budget, still bound the loop: after about 5–6 improvement rounds, or once the remaining differences are small details, finish unless the user asked for open-ended refinement. Returns diminish quickly, and a render still running when the session ends can lose everything.

## 3. Build script rules

- **One idempotent script** (`build.py`). Put `H.reset_scene()` first and a `P = {...}` dict of tunables at the top. Write one function per part or component and a `main()` that builds, frames, lights, renders and saves. Rerunning it must reproduce the scene exactly; use seeded `random.Random(seed)` for any randomness.
- **Preview and final modes in the same script.** Rendering at full quality every round wastes most of a time budget: one 1200×800 Cycles CPU frame can take minutes. For example:
  ```python
  FINAL = "--final" in sys.argv
  H.set_render(resolution=(1200, 800), samples=32 if FINAL else 12, percentage=100 if FINAL else 50)
  H.render_still("/out/render.png" if FINAL else "/tmp/preview.png", background="#FFFFFF")
  if FINAL:
      H.save_blend("/out/scene.blend")
  ```
  Run `--final` once early, as soon as a complete first version exists, and again at the end.
- **Conventions.** Units are metres and Z is up. The subject's front faces **−Y**, so the front-view camera sits on −Y and `frame_objects(azimuth=0)` looks at the front; azimuth 35 is front-right three-quarter. Build objects resting on z = 0.
- **Derive positions from what is already built.** Wheels go at the body's bbox corners, a lid on the rim height, a handle at the wall radius. Avoid magic coordinates. Joined parts should touch or overlap slightly; gaps and floating pieces are the most common defect. Verify with `H.bbox`, `H.ground_contacts()` and a side or top view.
- **Prefer the data API and the helpers to `bpy.ops`.** Most operators need a UI context that background mode lacks. Keep Python references to objects, because names collide and get `.001` suffixes.
- **Shape toolbox.** Pick the construction that matches the visible form:

  | Form | Construction |
  |---|---|
  | Round, symmetric: cups, bottles, lamps, wheels, domes, bells, columns | `add_lathe` with a measured profile |
  | Flat or extruded silhouette: fins, wings, brackets, gears, signs, side panels | `add_extrusion` |
  | Thin round members: handles, pipes, frames, cables, rails, legs, spokes, ropes | `add_tube` along points |
  | Hard-surface blocks | boxes with `bevel` |
  | Holes, slots, windows, cut panels | `boolean` |
  | Smooth organic forms | scaled spheres plus `SUBSURF`, or a lathe |
  | Symmetry | `MIRROR` modifier |
  | Rows and rings of identical parts | `ARRAY` modifier, or loops with `instance` |
  | Hundreds to millions of repeats (grass, trees, rocks, crowds) | instancing or Geometry Nodes scattering (see environments.md) |

- **Bevel hard edges slightly** (about 1–3% of the part size) and use smooth shading by angle. Perfectly sharp edges and faceted curves read as CG.
- **Spend detail where the camera looks.** A part that covers ten pixels needs the right colour, not geometry.

## 4. Materials

- Start from `H.material_preset(name, kind, "#RRGGBB", scale=...)` for any common material. It sets physically sensible values and adds the grain, pores or brushing that make a surface read as that material. Use `H.material(name, "#RRGGBB", roughness, metallic, ...)` for anything else. Hex colours are sRGB; tuples are linear. Keep the base colour between about 0.03 and 0.9 linear. Pure black or white albedo looks fake and clips.
- Typical settings:

  | Material | Settings |
  |---|---|
  | Metal | `metallic=1`, colour carries the tint (gold, brass, copper), roughness 0.15–0.4 |
  | Glass | `transmission=1`, `roughness=0`, `ior=1.45` |
  | Glossy plastic or paint | roughness 0.2–0.4, plus `coat` for car paint and lacquer |
  | Rubber or tyres | dark, roughness 0.7–0.9 |
  | Wood, leather, fabric, stone, brushed metal | `material_preset` kinds: they add the grain or texture |
  | Glowing screens and lamps | `emission=` colour with `emission_strength` |

- Uniform colour on large surfaces is the strongest CG tell. Add `H.add_noise_variation`, procedural textures, wear in crevices, or several material zones. Match colours to the reference by eye under the final lighting, not under a debug light.

## 5. Camera, light and colour management

- **Camera.** Use `H.frame_objects(cam, objs, azimuth, elevation, margin)` for exact framing. A margin of about 1.1–1.2 leaves breathing room; a subject that should fill about 80% of the frame needs about 1.1.
  - Object shots: 50–85 mm.
  - Environments and interiors: 20–35 mm.
  - Telephoto (100–200 mm) compresses depth and makes large things look massive.
  - Match a reference's viewpoint (azimuth, elevation, lens feel) before judging anything else.
- **Pick the lighting setup from the situation:**

  | Situation | Setup |
  |---|---|
  | Object or product on a plain or white background | `H.studio_lighting(target=objs, contrast=0.6, softness=0.5)` plus `H.render_still(path, background="#FFFFFF")` (see below), with `set_render(view_transform="Khronos PBR Neutral")` (4.2+, falls back) for true colours and clean whites. Match the reference: raise `contrast` (up to about 0.85) for deep shadow sides, lower `softness` for crisp specular highlights and sharper shadows, and put `key_azimuth` on the side the highlights come from |
  | Outdoor daylight | `H.sun_and_sky(elevation, azimuth)` with AgX. Use a low sun (5–20°) for warm, long shadows and drama |
  | Overcast | sky or HDRI only, no sun, soft shadows |
  | Interior | area lights at windows and ceiling fixtures, plus visible practical lamps (emission), with a dim world |
  | Night or dramatic | few strong, coloured practical lights, a weak cool moon or sky, haze (`volume_fog`) for light shafts |

  `render_still(path, background="#FFFFFF")` renders with a transparent film, so the shadow-catcher floor keeps a soft contact shadow, then flattens the result onto the background colour. The background stays exactly the requested colour while the subject is lit independently. Never light an object with a bright white world: it flattens the form and washes out colours. If the background must be a real visible surface (a coloured backdrop or table), use a real floor and backdrop instead.
- **Exposure.** Check that the subject has a lit side, a shadow side and specular highlights, that whites are not clipped flat, and that darks are not crushed. Adjust light power first, then `exposure`.

## 6. Verify every round (cheaply)

- **Preview settings.** 25–50% resolution, 12–32 samples, with denoising when the build supports it (`set_render` checks). Final settings only at the end.
- **Look at every render you make** (`read_file` the PNG). Compare against the reference or brief: silhouette, proportions, part count, colours, light direction, framing, background. Write down the biggest difference before changing anything.
- **Multiple angles.**
  `blender -b scene.blend --python-exit-code 1 -P <skill-dir>/scripts/contact_sheet.py -- --out review/views.png`
  This renders front, right, top and three-quarter views plus the scene camera. Add `--clay` to judge form without colour, and `--frames 1,40,80,120` for motion.
- **Reference numbers.** With a reference image of an object, run `ref_check.py` after each render and fix its top verdict (see object-modeling.md). With animation, run `motion_check.py` before the final render (see animation.md).
- **Numbers, not impressions.** `H.report()` prints sizes, the lowest z of each object and polygon counts. Compare sizes with the plan; any object whose lowest z is not 0 (or not resting on its support) is floating or sunk. For animations, sample positions at several frames.
- **Optional independent review.** When stakes are high and time allows, a fresh subagent shown only the reference and the renders can give an unbiased critique. Never give it your intent; see image-reconstruction.md for the protocol.

## 7. Finish checklist

- Every requested output exists at the exact path, resolution, engine, samples and frame range. Each was produced by the final build, and the `.blend` was saved after that build.
- `blender -b --factory-startup --python-exit-code 1 -P build.py` reruns cleanly. For video, frames or MP4 exist and were spot-checked.
- Report: what was built, which checks were run and what they showed, and remaining differences or assumptions, stated plainly.

## Pitfalls that cost the most

- Detailing before proportions, framing and light are right.
- Running out of time with a missing or stale deliverable. Produce it early and update it as you go.
- Judging only from the main camera: floating parts, intersecting parts and missing back sides hide there.
- Washed-out renders from a white world or overpowered lights; muddy renders from a single weak light. Use the recipes above.
- A subject too small in frame or cut off. Use `frame_objects`, and check the margin on the render.
- Socket and enum names that differ by version (Principled inputs, EEVEE engine id, sky types, `Action.fcurves`). Use the helpers or read [bpy-pitfalls.md](references/bpy-pitfalls.md).
- `bpy.ops` calls that silently do nothing in background mode. Use the data API or `temp_override`.
- Physics that is never baked, or renders from the wrong frame. Bake, then `scene.frame_set(f)` before reading or rendering.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
