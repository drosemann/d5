// Goose-Port-Spiegel von: projects/personal-client-websites-volcan-chico/app.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/personal-client-websites-volcan-chico/app.js");
}

// ---- Original-Code (projects/personal-client-websites-volcan-chico/app.js), unveraendert, als Inline-Doku ----
// (function(){
// "use strict";
// var reduced=matchMedia("(prefers-reduced-motion: reduce)").matches;
// var body=document.body, chili=document.getElementById("chili"), face=document.getElementById("face"),
// mouth=document.getElementById("mouth"), readout=document.getElementById("readout"),
// wm1=document.getElementById("wm1"), ay=document.getElementById("ay"),
// cv=document.getElementById("lava"), ctx=cv.getContext("2d");
// var NAMES={1:"“ABRAZO SUEVE”",2:"“PICANTE FRIENDLY”",3:"“LEVANTA CEJAS”",4:"“SUDOR DIVERTIDO”",5:"“¡ÓRALE!”",6:"“BOCA BRAVA”",7:"“LLORADERA FELIZ”",8:"“MODO DIABLO”",9:"“FIRMA AQUÍ”",10:"“¡ADIÓS!”"};
// var heat=2, erupting=false;
// function sizeCv(){cv.width=innerWidth;cv.height=innerHeight;}
// addEventListener("resize",sizeCv);sizeCv();
// function setHeat(n,fire){
// heat=Math.max(1,Math.min(10,Math.round(n)));
// body.dataset.heat=heat;
// document.documentElement.style.setProperty("--heat",heat);
// document.documentElement.style.setProperty("--jit",(1+heat*0.9)+"px");
// document.documentElement.style.setProperty("--jitt",Math.max(0.12,0.62-heat*0.05)+"s");
// chili.setAttribute("aria-valuenow",heat);
// var y=250-((heat-1)/9)*180; face.setAttribute("cy",y);
// mouth.setAttribute("d","M44 "+(y+5)+" q8 "+(heat>6?12:8)+" 16 0");
// readout.textContent="LVL "+heat+" · "+NAMES[heat];
// if(fire&&heat===10)erupt();
// }
// // drag / click / keys on chili thermometer
// var drag=false;
// function heatFromEvent(e){var r=chili.getBoundingClientRect();var y=(e.touches?e.touches[0].clientY:e.clientY)-r.top;var p=1-y/r.height;return 1+p*9;}
// chili.addEventListener("pointerdown",function(e){drag=true;chili.setPointerCapture(e.pointerId);setHeat(heatFromEvent(e));});
// chili.addEventListener("pointermove",function(e){if(drag)setHeat(heatFromEvent(e));});
// addEventListener("pointerup",function(){drag=false;});
// chili.addEventListener("keydown",function(e){
// if(e.key==="ArrowUp"||e.key==="ArrowRight"){setHeat(heat+1);e.preventDefault();}
// else if(e.key==="ArrowDown"||e.key==="ArrowLeft"){setHeat(heat-1);e.preventDefault();}
// else if(e.key==="PageUp"){setHeat(heat+2);e.preventDefault();}
// else if(e.key==="PageDown"){setHeat(heat-2);e.preventDefault();}
// else if(e.key==="Home"){setHeat(1);e.preventDefault();}
// else if(e.key==="End"){setHeat(10,true);e.preventDefault();}
// });
// // eruption: ballistic confetti-lava + ¡AY! + spring back to 2
// var parts=[];
// var COLORS=["#FF4B1F","#FFD60A","#00A6A6","#FF7BAC","#111111","#FFF8E7"];
// function erupt(){
// if(erupting)return;erupting=true;
// var r=cv.getBoundingClientRect();
// var n=reduced?0:160;
// for(var i=0;i<n;i++){
// var x=Math.random()*cv.width;
// parts.push({x:x,y:-20-Math.random()*200,vx:(Math.random()-0.5)*3,vy:2+Math.random()*5,
// s:6+Math.random()*16,c:COLORS[i%COLORS.length],rot:Math.random()*6,vr:(Math.random()-0.5)*0.3,k:i%4});
// }
// if(!reduced){ay.classList.add("show");wm1.setAttribute("aria-label","¡AY!");}
// var old=wm1.textContent;wm1.dataset.old=old;
// wm1.innerHTML="<span>¡</span><span>A</span><span>Y</span><span>!</span>";
// requestAnimationFrame(tick);
// setTimeout(function(){ // springy return to 2
// ay.classList.remove("show");wm1.innerHTML="";old.split("").forEach(function(ch){if(ch===" "){var s=document.createElement("span");s.className="sp";wm1.appendChild(s);}else{var g=document.createElement("span");g.textContent=ch;wm1.appendChild(g);}});
// var v=10,t0=null;
// function spring(t){if(!t0)t0=t;var p=Math.min(1,(t-t0)/900);var e=1-Math.pow(1-p,3);setHeat(10+(2-10)*e);if(p<1)requestAnimationFrame(spring);else{erupting=false;setHeat(2);}}
// requestAnimationFrame(spring);
// },reduced?400:2200);
// }
// function tick(){
// ctx.clearRect(0,0,cv.width,cv.height);
// parts.forEach(function(p){
// p.vy+=0.12;p.x+=p.vx;p.y+=p.vy;p.rot+=p.vr;
// if(p.y>cv.height-10){p.y=cv.height-10;p.vy*=-0.55;p.vx*=0.9;}
// if(p.x<0||p.x>cv.width)p.vx*=-1;
// ctx.save();ctx.translate(p.x,p.y);ctx.rotate(p.rot);
// ctx.fillStyle=p.c;ctx.strokeStyle="#111";ctx.lineWidth=3;
// if(p.k===0)ctx.fillRect(-p.s/2,-p.s/2,p.s,p.s);
// else if(p.k===1){ctx.beginPath();ctx.moveTo(0,-p.s/2);ctx.lineTo(p.s/2,p.s/2);ctx.lineTo(-p.s/2,p.s/2);ctx.closePath();ctx.fill();}
// else{ctx.beginPath();ctx.arc(0,0,p.s/2,0,7);ctx.fill();}
// ctx.stroke();ctx.restore();
// });
// ctx.fillStyle="rgba(0,0,0,0)";ctx.fillRect(0,0,1,1);
// parts=parts.filter(function(p){return p.y<cv.height+40;});
// if(parts.length&&!reduced)requestAnimationFrame(tick);else{ctx.clearRect(0,0,cv.width,cv.height);parts=[];}
// }
// // card tilt: shadow slides opposite
// document.querySelectorAll(".tilt").forEach(function(card){
// card.addEventListener("pointermove",function(e){
// if(reduced)return;var r=card.getBoundingClientRect();
// var dx=(e.clientX-r.left)/r.width-0.5,dy=(e.clientY-r.top)/r.height-0.5;
// card.style.transform="perspective(600px) rotateY("+(dx*10)+"deg) rotateX("+(-dy*10)+"deg)";
// card.style.boxShadow=(-dx*16)+"px "+(-dy*16+10)+"px 0 #111";
// });
// card.addEventListener("pointerleave",function(){card.style.transform="";card.style.boxShadow="";});
// });
// // add-to-pedido jumps to order pad
// var chips=[].slice.call(document.querySelectorAll("#chips .chip"));
// document.querySelectorAll(".add").forEach(function(b){
// b.addEventListener("click",function(){
// var s=b.closest(".card").dataset.sauce;
// chips.forEach(function(c){c.classList.toggle("on",c.dataset.s===s);});
// document.getElementById("order").scrollIntoView({behavior:reduced?"auto":"smooth"});
// b.textContent="¡EN EL PEDIDO! ✓";setTimeout(function(){b.textContent="Add to pedido +";},1200);
// });
// });
// // pairing splats
// document.getElementById("tiles").addEventListener("click",function(e){
// var t=e.target.closest(".tile");if(t)t.classList.toggle("splat");
// });
// document.querySelectorAll(".tile").forEach(function(t){t.addEventListener("mouseenter",function(){if(matchMedia("(pointer:fine)").matches)t.classList.add("splat");});});
// // order pad: chips, stepper, stamp
// chips.forEach(function(c){c.addEventListener("click",function(){c.classList.toggle("on");});});
// var qty=3,qEl=document.getElementById("qty");
// document.getElementById("plus").addEventListener("click",function(){qty=Math.min(24,qty+1);qEl.textContent=qty;});
// document.getElementById("minus").addEventListener("click",function(){qty=Math.max(1,qty-1);qEl.textContent=qty;});
// var pad=document.getElementById("pad"),beto=document.getElementById("beto"),
// stamp=document.getElementById("stamp"),receipt=document.getElementById("receipt"),done=false;
// pad.addEventListener("submit",function(e){
// e.preventDefault();
// if(done){stamp.hidden=true;receipt.hidden=true;done=false;document.getElementById("sendBtn").textContent="Send me the trouble";return;}
// var name=document.getElementById("nombre");
// if(!name.value.trim()){beto.hidden=false;pad.classList.remove("shake");void pad.offsetWidth;pad.classList.add("shake");name.focus();return;}
// beto.hidden=true;
// var picked=chips.filter(function(c){return c.classList.contains("on");}).map(function(c){return c.dataset.s;});
// if(!picked.length)picked=["No. 1 Verde Tranquilo"];
// stamp.hidden=false;receipt.hidden=false;done=true;
// document.getElementById("sendBtn").textContent="OTRO PEDIDO ↺";
// receipt.textContent="RECIBO ★ "+name.value.trim().toUpperCase()+" ×"+qty+" → "+picked.join(" + ")+" · paga con abrazo · ¡gracias!";
// if(!reduced){stamp.style.animation="none";void stamp.offsetWidth;stamp.style.animation="";}
// });
// setHeat(2);
// })();
//
