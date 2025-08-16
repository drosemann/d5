/*
Neon Garden — Orb Runner
main.js

Game concept, visual aesthetic, gameplay loop:
- Concept: You control a luminous orb that endlessly orbits the center of a mysterious neon garden. Thorn obstacles spawn from the edges and fly inward along radial lanes; glowing seeds drift in and can be collected for points. Tap/click to flip the orb's rotation direction to dodge and weave.
- Aesthetic: Calm, neon-cyber nature: deep teal/indigo background, soft glows, pastel neon accents, smooth easing animations, and gentle particle trails. Subtle bloom-style glow is simulated via layered graphics and alpha.
- Loop: Quick to learn — a single input toggles direction. Survive as long as possible while collecting seeds. Difficulty ramps: spawn rate and obstacle speed increase over time. High score persists in localStorage.

Asset list (suggested royalty-free audio links; the game also uses programmatic synth so it works offline):
- Background music (royalty-free suggestions):
  - https://pixabay.com/music/ambient-calm-11802/ (search on Pixabay for "Ambient Calm")
  - https://www.freepd.com/ (browse "drone" or "ambient")
- Sound effects (royalty-free suggestions):
  - https://freesound.org/ (search "click" "collect" "hit")
  - https://pixabay.com/sound-effects/ (search "collect")

Notes: The code uses programmatic WebAudio for simple music and SFX so the game runs locally by opening index.html without extra downloads.
*/

// Game configuration
const config = {
  type: Phaser.AUTO,
  parent: 'game-container',
  width: 900,
  height: 600,
  backgroundColor: 0x07141a,
  scale: {
    mode: Phaser.Scale.RESIZE,
    autoCenter: Phaser.Scale.CENTER_BOTH
  },
  scene: {
    preload, create, update
  }
};

const game = new Phaser.Game(config);

let centerX, centerY;

// gameplay state
let orb, angularSpeed = 0.02, angle = 0, radius = 160, direction = 1;
let obstacles, seeds, particles, scoreText, timeText, startText, highScore = 0;
let spawnTimer = 0, spawnInterval = 1500, gameOver = false, score = 0, elapsed = 0;
let difficultyTimer = 0;
let audioEngine;

function preload() {
  // No external images required; create shapes in code at create-time.
}

function create() {
  centerX = this.scale.width/2;
  centerY = this.scale.height/2;

  // Load high score
  try { highScore = parseInt(localStorage.getItem('neon_orb_high') || '0', 10) || 0 } catch(e){ highScore = 0 }

  // Groups
  obstacles = this.add.group();
  seeds = this.add.group();

  // Particles for seed collect and collisions
  particles = this.add.particles(null);

  // Background subtle animated gradient created with graphics texture
  createBackground(this);

  // Create center garden hub
  const hub = this.add.graphics();
  hub.fillStyle(0x0b2740, 1);
  hub.fillCircle(centerX, centerY, 48);
  hub.fillStyle(0x1acfc2, 0.06);
  hub.fillCircle(centerX, centerY, 120);

  // Glowing rings
  for (let i=0;i<3;i++){
    const g = this.add.graphics();
    g.lineStyle(2, 0x7fffe9, 0.08*(3-i));
    g.strokeCircle(centerX, centerY, 70 + i*24);
  }

  // Orb (player)
  orb = this.add.container(centerX + radius, centerY);
  const orbGlow = this.add.circle(0,0,24, 0x9ef1de, 0.08);
  const orbCore = this.add.circle(0,0,10, 0xa2fff0, 1);
  orb.add([orbGlow, orbCore]);
  orb.setDepth(2);

  // Input: toggle direction
  this.input.on('pointerdown', ()=>{
    if (gameOver) restartGame.call(this); else direction *= -1; playClick();
  });

  // UI
  scoreText = this.add.text(16,16, 'Score: 0', { font: '18px Poppins, system-ui', fill: '#d9fff6' }).setDepth(10);
  timeText = this.add.text(16,40, 'Time: 0.0s', { font: '14px Poppins, system-ui', fill: '#b8fff0' }).setDepth(10);
  startText = this.add.text(this.scale.width/2, this.scale.height/2, 'CLICK OR TAP TO START', { font: '22px Poppins', fill:'#9ef1de' }).setOrigin(0.5).setDepth(11);

  // High score display
  const hs = this.add.text(this.scale.width-16,16, 'Best: '+highScore, { font: '16px Poppins', fill:'#9ef1de' }).setOrigin(1,0).setDepth(10);

  // Programmatic audio engine
  audioEngine = new SimpleAudio();
  audioEngine.playAmbient();

  // Particle emitter (reuse)
  particles.createEmitter({
    x: 0, y: 0, speed: { min: -80, max: 80 }, scale: { start: 0.6, end: 0 }, alpha: { start: 0.9, end:0 }, lifespan: 600,
    blendMode: 'ADD', tint: 0xa2fff0
  });

  // Resize handler
  this.scale.on('resize', (gameSize)=>{
    centerX = gameSize.width/2; centerY = gameSize.height/2;
    startText.setPosition(gameSize.width/2, gameSize.height/2);
  });

  // show gentle instruction pulse
  this.tweens.add({ targets: orb, duration: 900, scale: { from: 0.98, to: 1.02}, yoyo:true, loop:-1 });
}

function update(time, dt) {
  if (gameOver) return;

  // Start game when first click toggles direction: startText removed once score/time starts
  if (startText.visible && (this.input.activePointer.isDown)) startText.setVisible(false);

  const delta = dt;

  // update timers
  spawnTimer += delta;
  difficultyTimer += delta;
  elapsed += delta/1000;

  // increase difficulty slowly
  if (difficultyTimer > 5000) {
    difficultyTimer = 0; spawnInterval = Math.max(600, spawnInterval - 80); angularSpeed += 0.001;
  }

  // spawn obstacles and seeds
  if (spawnTimer > spawnInterval && !startText.visible) {
    spawnTimer = 0;
    // randomize spawn: 70% obstacles, 30% seeds
    if (Math.random() < 0.72) spawnObstacle(this); else spawnSeed(this);
  }

  // rotate orb
  angle += direction * angularSpeed * delta;
  const x = centerX + Math.cos(angle) * radius;
  const y = centerY + Math.sin(angle) * radius;
  orb.setPosition(x,y);

  // small trailing particles
  for (let i=0;i<1;i++){
    const p = this.add.circle(orb.x + Phaser.Math.Between(-6,6), orb.y + Phaser.Math.Between(-6,6), 1.4, 0xa7fff6, 0.8);
    this.tweens.add({ targets: p, alpha:0, duration: 500, onComplete: ()=>p.destroy() });
  }

  // update obstacles
  Phaser.Actions.Call(obstacles.getChildren(), function(o){
    o.x += o.vx * delta/16; o.y += o.vy * delta/16; o.rotation += o.spin * delta/1000;
    // off-screen kill
    if (Phaser.Math.Distance.Between(o.x,o.y, centerX, centerY) < 18) {
      // reach center -> destroy
      o.destroy();
      // optional: make small pulse
    }
    // collision with orb
    if (Phaser.Math.Distance.Between(o.x,o.y, orb.x, orb.y) < 18) {
      explodeAt(this, orb.x, orb.y); playHit(); endGame.call(this);
    }
  }, this);

  // update seeds
  Phaser.Actions.Call(seeds.getChildren(), function(s){
    s.x += s.vx * delta/16; s.y += s.vy * delta/16; s.rotation += 0.01 * delta/16;
    if (Phaser.Math.Distance.Between(s.x,s.y, orb.x, orb.y) < 20) {
      // collect
      score += 10; scoreText.setText('Score: '+score);
      collectAt(this, s.x, s.y); playCollect(); s.destroy();
    }
    if (Phaser.Math.Distance.Between(s.x,s.y, centerX, centerY) < 18) s.destroy();
  }, this);

  // update UI
  timeText.setText('Time: '+elapsed.toFixed(1)+'s');
}

// Helpers
function createBackground(scene){
  // create a subtle animated grid/flow using offscreen render texture
  const rt = scene.make.renderTexture({ width: scene.scale.width, height: scene.scale.height, add: true });
  const g = scene.add.graphics();
  const w = scene.scale.width, h = scene.scale.height;
  // radial soft shapes
  for (let i=0;i<8;i++){
    const color = Phaser.Display.Color.Interpolate.ColorWithColor(
      new Phaser.Display.Color().setTo(6,20,30), new Phaser.Display.Color().setTo(22,92,108), 8, i
    );
    g.fillStyle(Phaser.Display.Color.GetColor(color.r,color.g,color.b), 0.06);
    g.fillCircle(w/2 + (i-3.5)*40, h/2 + (i-3.5)*12, 200 + i*30);
  }
  rt.draw(g);
  g.destroy();
  rt.setBlendMode(Phaser.BlendModes.SCREEN);
}

function spawnObstacle(scene){
  // spawn from perimeter toward center
  const edge = Phaser.Math.Between(0,3);
  const w = scene.scale.width, h = scene.scale.height;
  let x,y;
  if (edge===0){ x = Phaser.Math.Between(0,w); y = -20; }
  else if (edge===1){ x = w+20; y = Phaser.Math.Between(0,h); }
  else if (edge===2){ x = Phaser.Math.Between(0,w); y = h+20; }
  else { x = -20; y = Phaser.Math.Between(0,h); }

  // create thorn graphic texture
  const s = scene.add.container(x,y);
  const thorn = scene.add.triangle(0,0, 0,-20, 12,12, -12,12, 0xff6b6b);
  thorn.setStrokeStyle(2, 0xff9f9f, 0.25);
  thorn.setScale(1.1);
  s.add(thorn);
  scene.add.existing(s);
  obstacles.add(s);

  const dir = new Phaser.Math.Vector2(centerX - x, centerY - y).normalize();
  const speed = Phaser.Math.Between(60, 140) + Math.min(0, Math.floor((1500-spawnInterval)/20));
  s.vx = dir.x * speed; s.vy = dir.y * speed; s.spin = (Math.random()<0.5? -1:1)*Phaser.Math.FloatBetween(0.5,2);
  s.setDepth(3);
}

function spawnSeed(scene){
  const w = scene.scale.width, h = scene.scale.height;
  const angleRad = Phaser.Math.FloatBetween(0, Math.PI*2);
  const dist = Math.max(w,h)/2 + 20;
  const x = centerX + Math.cos(angleRad)*dist;
  const y = centerY + Math.sin(angleRad)*dist;
  const s = scene.add.container(x,y);
  const glow = scene.add.circle(0,0,8, 0xa2fff0, 0.16);
  const core = scene.add.circle(0,0,4, 0xc9fff6, 1);
  s.add([glow, core]); scene.add.existing(s); seeds.add(s);
  const dir = new Phaser.Math.Vector2(centerX - x, centerY - y).normalize();
  const speed = Phaser.Math.Between(25, 60);
  s.vx = dir.x * speed; s.vy = dir.y * speed;
  s.setDepth(2);
}

function explodeAt(scene, x, y){
  const pts = scene.add.particles(null);
  const emitter = pts.createEmitter({ x:x, y:y, speed: { min: -200, max:200 }, scale: { start: 0.9, end: 0 }, tint: [0xff7b7b,0xffd2d2], lifespan: 700, blendMode:'ADD' });
  scene.time.delayedCall(700, ()=>{ pts.destroy(); });
}

function collectAt(scene, x, y){
  const pts = scene.add.particles(null);
  const emitter = pts.createEmitter({ x:x, y:y, speed: { min: -60, max:60 }, scale: { start: 0.6, end: 0 }, tint: [0x9ef1de,0xc9fff6], lifespan: 500, blendMode:'ADD' });
  scene.time.delayedCall(500, ()=>{ pts.destroy(); });
}

function endGame(){
  gameOver = true;
  startText.setText('GAME OVER — CLICK TO RESTART').setVisible(true);
  // persist high score
  if (score > highScore){ highScore = score; try{ localStorage.setItem('neon_orb_high', String(highScore)); }catch(e){} }
}

function restartGame(){
  // cleanup
  Phaser.Actions.Call(obstacles.getChildren(), c=>c.destroy()); Phaser.Actions.Call(seeds.getChildren(), c=>c.destroy());
  score = 0; elapsed = 0; spawnInterval = 1500; angularSpeed = 0.02; direction = 1; gameOver = false;
  scoreText.setText('Score: 0'); startText.setVisible(false);
}

// Simple programmatic audio helper (ambient pad + effects)
class SimpleAudio {
  constructor(){
    try{ this.ctx = new (window.AudioContext || window.webkitAudioContext)(); }catch(e){ this.ctx = null }
    this.ambient = null; this.gain = null; if (this.ctx) this.setup();
  }
  setup(){
    const ctx = this.ctx;
    this.gain = ctx.createGain(); this.gain.gain.value = 0.06; this.gain.connect(ctx.destination);
    // create a slow evolving oscillator + filtered noise for pad
    const osc = ctx.createOscillator(); osc.type = 'sine'; osc.frequency.value = 110;
    const osc2 = ctx.createOscillator(); osc2.type = 'sine'; osc2.frequency.value = 55; osc2.detune.value = 10;
    const f = ctx.createBiquadFilter(); f.type = 'lowpass'; f.frequency.value = 800;
    const oscGain = ctx.createGain(); oscGain.gain.value = 0.5;
    osc.connect(oscGain); osc2.connect(oscGain); oscGain.connect(f); f.connect(this.gain);
    osc.start(); osc2.start();
    this.osc = [osc,osc2];
    // gentle amplitude lfo
    const lfo = ctx.createOscillator(); lfo.frequency.value = 0.08; const lfoGain = ctx.createGain(); lfoGain.gain.value = 0.04; lfo.connect(lfoGain); lfoGain.connect(this.gain.gain); lfo.start();
  }
  playAmbient(){ if (!this.ctx) return; /* audio already started in setup */ }
  playClick(){ if (!this.ctx) return; const ctx=this.ctx; const o=ctx.createOscillator(); const g=ctx.createGain(); o.frequency.value=880; o.type='square'; g.gain.value=0.0018; o.connect(g); g.connect(ctx.destination); o.start(); g.gain.exponentialRampToValueAtTime(0.00001, ctx.currentTime + 0.2); o.stop(ctx.currentTime + 0.25); }
  playCollect(){ if (!this.ctx) return; const ctx=this.ctx; const o=ctx.createOscillator(); const g=ctx.createGain(); o.type='sine'; o.frequency.value=440; g.gain.value=0.002; o.connect(g); g.connect(ctx.destination); o.start(); o.frequency.exponentialRampToValueAtTime(880, ctx.currentTime + 0.12); g.gain.exponentialRampToValueAtTime(0.00001, ctx.currentTime + 0.22); o.stop(ctx.currentTime + 0.25); }
  playHit(){ if (!this.ctx) return; const ctx=this.ctx; const o=ctx.createOscillator(); const g=ctx.createGain(); o.type='sawtooth'; o.frequency.value=120; g.gain.value=0.005; o.connect(g); g.connect(ctx.destination); o.start(); o.frequency.exponentialRampToValueAtTime(40, ctx.currentTime + 0.25); g.gain.exponentialRampToValueAtTime(0.00001, ctx.currentTime + 0.5); o.stop(ctx.currentTime + 0.6); }
}

// wrapper play functions that check audio engine
function playClick(){ if (audioEngine) audioEngine.playClick(); }
function playCollect(){ if (audioEngine) audioEngine.playCollect(); }
function playHit(){ if (audioEngine) audioEngine.playHit(); }

// Quality-of-life: pause audio when page not visible
window.addEventListener('blur', ()=>{ try{ if (audioEngine && audioEngine.gain) audioEngine.gain.gain.setValueAtTime(0.0, audioEngine.ctx.currentTime); } catch(e){} });
window.addEventListener('focus', ()=>{ try{ if (audioEngine && audioEngine.gain) audioEngine.gain.gain.setValueAtTime(0.06, audioEngine.ctx.currentTime); } catch(e){} });
