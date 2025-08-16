'use client'

import { useEffect, useRef, useState } from 'react'
import * as THREE from 'three'

interface Ripple {
  x: number
  y: number
  radius: number
  maxRadius: number
  life: number
  maxLife: number
}

const CosmicBackground = () => {
  const mountRef = useRef<HTMLDivElement>(null)
  const sceneRef = useRef<THREE.Scene>()
  const cameraRef = useRef<THREE.PerspectiveCamera>()
  const rendererRef = useRef<THREE.WebGLRenderer>()
  const starsRef = useRef<THREE.Points>()
  const nebulaeRef = useRef<THREE.Group>()
  const animationRef = useRef<number>()
  const [ripples, setRipples] = useState<Ripple[]>([])
  const mousePosition = useRef({ x: 0, y: 0 })

  useEffect(() => {
    if (!mountRef.current) return

    // Initialize Three.js
    const scene = new THREE.Scene()
    sceneRef.current = scene

    const camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth / window.innerHeight,
      0.1,
      1000
    )
    camera.position.z = 5
    cameraRef.current = camera

    const renderer = new THREE.WebGLRenderer({ 
      alpha: true,
      antialias: true 
    })
    renderer.setSize(window.innerWidth, window.innerHeight)
    renderer.setClearColor(0x000000, 1)
    rendererRef.current = renderer

    mountRef.current.appendChild(renderer.domElement)

    // Create stars
    const starGeometry = new THREE.BufferGeometry()
    const starCount = 5000
    const starPositions = new Float32Array(starCount * 3)
    const starSizes = new Float32Array(starCount)
    const starOpacities = new Float32Array(starCount)
    const originalPositions = new Float32Array(starCount * 3) // Store original positions

    for (let i = 0; i < starCount; i++) {
      const i3 = i * 3
      const x = (Math.random() - 0.5) * 100
      const y = (Math.random() - 0.5) * 100
      const z = (Math.random() - 0.5) * 100
      
      starPositions[i3] = x
      starPositions[i3 + 1] = y
      starPositions[i3 + 2] = z
      
      originalPositions[i3] = x
      originalPositions[i3 + 1] = y
      originalPositions[i3 + 2] = z
      
      starSizes[i] = Math.random() * 2 + 0.5
      starOpacities[i] = Math.random() * 0.8 + 0.2
    }

    starGeometry.setAttribute('position', new THREE.BufferAttribute(starPositions, 3))
    starGeometry.setAttribute('size', new THREE.BufferAttribute(starSizes, 1))
    starGeometry.setAttribute('opacity', new THREE.BufferAttribute(starOpacities, 1))
    starGeometry.setAttribute('originalPosition', new THREE.BufferAttribute(originalPositions, 3))

    const starMaterial = new THREE.ShaderMaterial({
      uniforms: {
        time: { value: 0 },
        mousePos: { value: new THREE.Vector2(0, 0) },
        ripples: { value: [] }
      },
      vertexShader: `
        attribute float size;
        attribute float opacity;
        attribute vec3 originalPosition;
        varying float vOpacity;
        uniform float time;
        uniform vec2 mousePos;
        
        struct Ripple {
          vec2 position;
          float radius;
          float maxRadius;
          float life;
          float maxLife;
        };
        
        uniform Ripple ripples[10];
        
        void main() {
          vec3 pos = originalPosition;
          
          // Apply ripple effects
          for (int i = 0; i < 10; i++) {
            if (ripples[i].life > 0.0) {
              vec2 ripplePos = ripples[i].position;
              float rippleRadius = ripples[i].radius;
              float rippleMaxRadius = ripples[i].maxRadius;
              float rippleLife = ripples[i].life / ripples[i].maxLife;
              
              float dist = distance(pos.xy, ripplePos);
              if (dist < rippleRadius && dist > rippleRadius - 2.0) {
                float pushStrength = (1.0 - rippleLife) * 0.5;
                vec2 pushDir = normalize(pos.xy - ripplePos);
                pos.xy += pushDir * pushStrength;
              }
            }
          }
          
          // Mouse interaction
          float mouseDist = distance(pos.xy, mousePos);
          if (mouseDist < 10.0) {
            float pushStrength = (1.0 - mouseDist / 10.0) * 2.0;
            vec2 pushDir = normalize(pos.xy - mousePos);
            pos.xy += pushDir * pushStrength;
          }
          
          // Smooth return to original position
          pos.xy += (originalPosition.xy - pos.xy) * 0.02;
          
          vOpacity = opacity * (0.5 + 0.5 * sin(time + originalPosition.x * 0.01));
          vec4 mvPosition = modelViewMatrix * vec4(pos, 1.0);
          gl_PointSize = size * (300.0 / -mvPosition.z);
          gl_Position = projectionMatrix * mvPosition;
        }
      `,
      fragmentShader: `
        varying float vOpacity;
        
        void main() {
          float dist = distance(gl_PointCoord, vec2(0.5));
          if (dist > 0.5) discard;
          
          float alpha = (1.0 - dist * 2.0) * vOpacity;
          gl_FragColor = vec4(1.0, 1.0, 1.0, alpha);
        }
      `,
      transparent: true,
      blending: THREE.AdditiveBlending,
      depthWrite: false
    })

    const stars = new THREE.Points(starGeometry, starMaterial)
    starsRef.current = stars
    scene.add(stars)

    // Create nebulae
    const nebulae = new THREE.Group()
    nebulaeRef.current = nebulae

    const nebulaColors = [
      new THREE.Color('#8B5CF6'), // Purple
      new THREE.Color('#C084FC'), // Light purple
      new THREE.Color('#F472B6')  // Pink
    ]

    for (let i = 0; i < 3; i++) {
      const nebulaGeometry = new THREE.SphereGeometry(15 + i * 5, 32, 32)
      const nebulaMaterial = new THREE.ShaderMaterial({
        uniforms: {
          color: { value: nebulaColors[i] },
          time: { value: 0 }
        },
        vertexShader: `
          varying vec2 vUv;
          varying vec3 vPosition;
          uniform float time;
          
          void main() {
            vUv = uv;
            vPosition = position;
            
            vec3 pos = position;
            pos.x += sin(time * 0.5 + position.y * 0.1) * 2.0;
            pos.y += cos(time * 0.3 + position.x * 0.1) * 2.0;
            pos.z += sin(time * 0.7 + position.x * 0.05) * 1.0;
            
            gl_Position = projectionMatrix * modelViewMatrix * vec4(pos, 1.0);
          }
        `,
        fragmentShader: `
          uniform vec3 color;
          uniform float time;
          varying vec2 vUv;
          varying vec3 vPosition;
          
          void main() {
            float dist = length(vUv - 0.5);
            float alpha = 0.0;
            
            if (dist < 0.5) {
              alpha = (0.5 - dist) * 0.3;
              alpha *= 0.5 + 0.5 * sin(time * 2.0 + vPosition.x * 0.1);
            }
            
            gl_FragColor = vec4(color, alpha);
          }
        `,
        transparent: true,
        blending: THREE.AdditiveBlending,
        depthWrite: false,
        side: THREE.DoubleSide
      })

      const nebula = new THREE.Mesh(nebulaGeometry, nebulaMaterial)
      nebula.position.set(
        (Math.random() - 0.5) * 30,
        (Math.random() - 0.5) * 30,
        (Math.random() - 0.5) * 30
      )
      nebulae.add(nebula)
    }

    scene.add(nebulae)

    // Mouse move handler
    const handleMouseMove = (event: MouseEvent) => {
      const rect = mountRef.current!.getBoundingClientRect()
      mousePosition.current = {
        x: ((event.clientX - rect.left) / rect.width) * 2 - 1,
        y: -((event.clientY - rect.top) / rect.height) * 2 + 1
      }
    }

    // Mouse click handler for ripples
    const handleMouseClick = (event: MouseEvent) => {
      const rect = mountRef.current!.getBoundingClientRect()
      const x = ((event.clientX - rect.left) / rect.width) * 2 - 1
      const y = -((event.clientY - rect.top) / rect.height) * 2 + 1
      
      setRipples(prev => [
        ...prev.slice(-9), // Keep only last 9 ripples
        {
          x: x * 50, // Scale to match the star field
          y: y * 50,
          radius: 0,
          maxRadius: 15 + Math.random() * 10,
          life: 1,
          maxLife: 1
        }
      ])
    }

    mountRef.current.addEventListener('mousemove', handleMouseMove)
    mountRef.current.addEventListener('click', handleMouseClick)

    // Animation loop
    let time = 0
    const animate = () => {
      animationRef.current = requestAnimationFrame(animate)
      time += 0.016

      // Update ripples
      setRipples(prev => {
        const updatedRipples = prev
          .map(ripple => ({
            ...ripple,
            radius: ripple.radius + 0.5,
            life: ripple.life - 0.01
          }))
          .filter(ripple => ripple.life > 0)
        
        // Update shader uniforms
        if (starsRef.current) {
          const material = starsRef.current.material as THREE.ShaderMaterial
          const rippleArray = updatedRipples.map(r => ({
            position: new THREE.Vector2(r.x, r.y),
            radius: r.radius,
            maxRadius: r.maxRadius,
            life: r.life,
            maxLife: r.maxLife
          }))
          
          // Pad with empty ripples
          while (rippleArray.length < 10) {
            rippleArray.push({
              position: new THREE.Vector2(0, 0),
              radius: 0,
              maxRadius: 0,
              life: 0,
              maxLife: 1
            })
          }
          
          material.uniforms.ripples.value = rippleArray
          material.uniforms.mousePos.value.set(mousePosition.current.x * 50, mousePosition.current.y * 50)
        }
        
        return updatedRipples
      })

      // Rotate scene
      scene.rotation.y += 0.001

      // Update star twinkle
      if (starsRef.current) {
        const starMaterial = starsRef.current.material as THREE.ShaderMaterial
        starMaterial.uniforms.time.value = time
      }

      // Update nebulae
      if (nebulaeRef.current) {
        nebulaeRef.current.children.forEach((nebula, index) => {
          const material = nebula.material as THREE.ShaderMaterial
          material.uniforms.time.value = time + index * Math.PI * 0.5
        })
      }

      renderer.render(scene, camera)
    }

    animate()

    // Handle window resize
    const handleResize = () => {
      if (cameraRef.current && rendererRef.current) {
        cameraRef.current.aspect = window.innerWidth / window.innerHeight
        cameraRef.current.updateProjectionMatrix()
        rendererRef.current.setSize(window.innerWidth, window.innerHeight)
      }
    }

    window.addEventListener('resize', handleResize)

    // Cleanup
    return () => {
      if (animationRef.current) {
        cancelAnimationFrame(animationRef.current)
      }
      window.removeEventListener('resize', handleResize)
      if (mountRef.current && rendererRef.current) {
        mountRef.current.removeEventListener('mousemove', handleMouseMove)
        mountRef.current.removeEventListener('click', handleMouseClick)
        mountRef.current.removeChild(rendererRef.current.domElement)
      }
      rendererRef.current?.dispose()
    }
  }, [])

  return (
    <div 
      ref={mountRef} 
      className="fixed inset-0 -z-50"
      style={{ 
        pointerEvents: 'auto',
        cursor: 'crosshair'
      }}
    />
  )
}

export default CosmicBackground