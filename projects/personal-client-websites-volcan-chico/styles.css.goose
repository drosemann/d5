// Goose-Port-Spiegel von: projects/personal-client-websites-volcan-chico/styles.css
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/personal-client-websites-volcan-chico/styles.css");
}

// ---- Original-Code (projects/personal-client-websites-volcan-chico/styles.css), unveraendert, als Inline-Doku ----
// :root{
// --lava:#FF4B1F; --banana:#FFD60A; --teal:#00A6A6; --pink:#FF7BAC; --ink:#111; --cream:#FFF8E7;
// --heat:2; --jit:2px; --jitt:.5s; --pop:cubic-bezier(.34,1.56,.64,1);
// --f1:#FFD60A; --f2:#FF7BAC; --f3:#00A6A6; --f4:#FFF8E7; --f5:#FF4B1F; --f6:#FFD60A;
// }
// *{box-sizing:border-box}
// html{scroll-behavior:smooth}
// body{margin:0;background:var(--ink);color:var(--ink);font-family:"Futura","Century Gothic","Trebuchet MS",Verdana,sans-serif;overflow-x:hidden}
// body[data-heat="8"],body[data-heat="9"],body[data-heat="10"]{--f1:#111;--f2:#FF4B1F;--f3:#111;--f4:#FF4B1F;--f5:#111;--f6:#FF4B1F}
// @media(pointer:fine){body{cursor:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='28' height='28'%3E%3Cpath d='M8 4 C4 12 6 20 14 24' stroke='%23111' stroke-width='7' stroke-linecap='round' fill='none'/%3E%3Cpath d='M8 4 C4 12 6 20 14 24' stroke='%23FF4B1F' stroke-width='4' stroke-linecap='round' fill='none'/%3E%3C/svg%3E") 6 22,auto}button,a{cursor:inherit}}
// .field{border-top:8px solid var(--ink);padding:2.2rem 1.2rem 3rem;position:relative;overflow:hidden;transition:background .3s steps(3)}
// .f-yellow{background:var(--f1)}.f-pink{background:var(--f2)}.f-teal{background:var(--f3)}.f-cream{background:var(--f4) url(#terra)}.f-cream{background-color:var(--f4)}.f-red{background:var(--f5);color:var(--cream)}
// .sec-title{font-family:Impact,"Arial Black","Helvetica Neue",sans-serif;font-size:clamp(2.6rem,9vw,6rem);margin:.4rem 0;text-transform:uppercase;line-height:.9;display:flex;flex-wrap:wrap;gap:.05em}
// .sec-title span{display:inline-block;background:#fff;border:4px solid var(--ink);box-shadow:6px 6px 0 var(--ink);padding:.02em .18em;margin:.06em;transform:rotate(var(--r,-2deg))}
// .sec-title span:nth-child(odd){--r:2.5deg;background:var(--banana)}
// .sec-title span:nth-child(even){--r:-2.5deg;background:var(--pink)}
// .sec-title.light span{background:var(--ink);color:var(--banana)}
// .sec-sub{font-family:monospace;font-size:.85rem;background:var(--ink);color:var(--cream);display:inline-block;padding:.3rem .7rem;transform:rotate(-1deg)}
// .wordmark{font-family:Impact,"Arial Black","Helvetica Neue",sans-serif;font-size:clamp(3rem,12vw,8.5rem);line-height:.85;margin:.5rem 0;text-transform:uppercase;display:flex;flex-wrap:wrap}
// .wordmark span{display:inline-block;background:#fff;border:5px solid var(--ink);box-shadow:8px 8px 0 var(--ink);padding:0 .12em;margin:.05em;transform:rotate(var(--r,2deg));animation:wob calc(var(--jitt)*4) steps(2) infinite}
// .wordmark span:nth-child(odd){--r:3deg}.wordmark span:nth-child(even){--r:-3deg;background:var(--pink)}
// .wordmark .sp{border:0;box-shadow:none;background:none;width:.3em}
// @keyframes wob{50%{transform:rotate(calc(var(--r,2deg) * -1)) translateY(calc(var(--jit) * -1))}}
// .tagline{font-weight:900;font-size:1.3rem;text-transform:uppercase}
// .sticker{display:inline-block;font-family:monospace;font-weight:bold;background:var(--lava);color:#fff;border:4px solid var(--ink);box-shadow:6px 6px 0 var(--ink);padding:.4rem .8rem;transform:rotate(-4deg);animation:jit var(--jitt) steps(2) infinite}
// @keyframes jit{50%{transform:rotate(-3deg) translate(var(--jit),calc(var(--jit) * -1))}}
// .memphis{font-size:2.4rem;font-weight:900;user-select:none}
// .m{display:inline-block;margin:.2em;animation:jit var(--jitt) steps(2) infinite}
// .tri{width:0;height:0;border-left:22px solid transparent;border-right:22px solid transparent;border-bottom:36px solid var(--teal);filter:drop-shadow(4px 4px 0 var(--ink))}
// .tri.t2{border-bottom-color:var(--pink);transform:rotate(30deg)}
// .dotring{width:38px;height:38px;border:6px dashed var(--ink);border-radius:50%;background:var(--banana)}
// .slab{width:70px;height:22px;background:repeating-linear-gradient(45deg,var(--ink) 0 6px,#fff 6px 12px);border:4px solid var(--ink)}
// .squig{color:var(--ink)}.cross{color:var(--lava);text-shadow:3px 3px 0 var(--ink)}
// .hero-row{display:flex;gap:2rem;flex-wrap:wrap;align-items:center}
// .bottle-wrap{animation:jit var(--jitt) steps(2) infinite}
// .bottle{width:min(300px,70vw);filter:drop-shadow(10px 10px 0 var(--ink));animation:shake calc(var(--jitt)*2) steps(2) infinite}
// @keyframes shake{50%{transform:translate(var(--jit),0) rotate(1deg)}}
// .bub{animation:bub 2s ease-in-out infinite alternate}.b2{animation-delay:.4s}.b3{animation-delay:.8s}
// @keyframes bub{to{transform:translateY(-8px)}}
// .cap{transform-origin:110px 100px;animation:rattle var(--jitt) steps(2) infinite}
// @keyframes rattle{50%{transform:rotate(4deg) translateX(3px)}}
// .price{font-family:monospace;font-weight:bold;background:var(--ink);color:var(--banana);display:inline-block;padding:.35rem .7rem;transform:rotate(2deg)}
// .price.big{font-size:1.1rem;background:#fff;color:var(--ink);border:4px solid var(--ink);box-shadow:6px 6px 0 var(--ink)}
// .big-sub{font-family:Impact,"Arial Black",sans-serif;font-size:clamp(2rem,6vw,4rem);line-height:.9;text-transform:uppercase;text-shadow:4px 4px 0 var(--pink)}
// .btn{display:inline-block;font-family:Impact,"Arial Black",sans-serif;text-transform:uppercase;letter-spacing:.03em;background:var(--teal);color:#fff;border:4px solid var(--ink);box-shadow:7px 7px 0 var(--ink);padding:.7rem 1.3rem;text-decoration:none;font-size:1.2rem;transform:rotate(-1deg);transition:transform .08s,box-shadow .08s}
// .btn:active{transform:translate(5px,5px);box-shadow:2px 2px 0 var(--ink)}
// .btn.small{font-size:.9rem;padding:.45rem .8rem}.btn.big{font-size:1.5rem;background:var(--lava)}
// .marquee{background:var(--ink);color:var(--banana);border-top:6px solid var(--ink);border-bottom:6px solid var(--ink);overflow:hidden;white-space:nowrap;font-family:Impact,"Arial Black",sans-serif;font-size:1.3rem;text-transform:uppercase}
// .marquee.rev{color:var(--pink)}
// .track{display:inline-block;animation:mq 12s linear infinite}
// .track span{padding:.4rem 0;display:inline-block}
// @keyframes mq{to{transform:translateX(-50%)}}
// .cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(240px,1fr));gap:1.4rem;margin-top:1rem}
// .card{background:#fff;border:5px solid var(--ink);box-shadow:10px 10px 0 var(--ink);padding:1rem;transform:rotate(-.8deg);transition:box-shadow .12s}
// .card.alt{transform:rotate(.9deg);background:var(--banana)}
// .card-top{font-family:monospace;font-size:.75rem;font-weight:bold;border-bottom:3px solid var(--ink);padding-bottom:.4rem}
// .card h3{font-family:Impact,"Arial Black",sans-serif;font-size:1.6rem;margin:.5rem 0;text-transform:uppercase}
// .ing{font-weight:bold}.quip{font-style:italic;background:var(--cream);border:3px solid var(--ink);padding:.4rem}
// .volc{width:120px}
// .heat-row{display:flex;gap:2rem;flex-wrap:wrap;align-items:flex-start}
// #chili{width:130px;filter:drop-shadow(6px 6px 0 var(--ink));touch-action:none}
// .hint,.fine{font-family:monospace;font-size:.8rem}
// .sweat-h{font-family:Impact,"Arial Black",sans-serif;font-size:clamp(1.6rem,5vw,3rem);position:relative}
// .sweat-h::after{content:"💧 💧 💧";position:absolute;left:0;top:100%;font-size:1rem;opacity:calc((var(--heat) - 3)/7);animation:drip 1.2s linear infinite}
// @keyframes drip{to{transform:translateY(10px)}}
// .bottle-wrap.mini{background:#fff;border:5px solid var(--ink);box-shadow:8px 8px 0 var(--ink);padding:1rem;font-size:2rem;transform:rotate(2deg)}
// .bottle-wrap.mini b,.bottle-wrap.mini i{display:block;font-size:.85rem}
// .tiles{display:grid;grid-template-columns:repeat(auto-fit,minmax(150px,1fr));gap:1rem;margin-top:1rem}
// .tile{position:relative;background:#fff;border:5px solid var(--ink);box-shadow:8px 8px 0 var(--ink);padding:1rem;font-family:inherit;overflow:hidden;transition:transform .08s,box-shadow .08s}
// .tile:active{transform:translate(5px,5px);box-shadow:2px 2px 0 var(--ink)}
// .tile .ico{font-size:2.4rem;display:block}
// .tile.splat::after{content:"";position:absolute;inset:8px;background:radial-gradient(circle at 60% 40%,var(--lava) 0 22%,var(--pink) 23% 34%,transparent 35%),radial-gradient(circle at 25% 70%,var(--lava) 0 12%,transparent 13%);pointer-events:none;transform:rotate(-12deg)}
// .wonky{background:#fff;border:5px solid var(--ink);box-shadow:12px 12px 0 var(--ink);padding:1.4rem;transform:rotate(-1.2deg);max-width:640px;font-size:1.15rem}
// .bus{width:min(300px,80vw)}
// #pad{background:#fff;border:6px solid var(--ink);box-shadow:12px 12px 0 var(--ink);padding:1.4rem;max-width:560px;transform:rotate(.6deg);position:relative}
// #pad label{display:block;font-family:monospace;font-weight:bold;margin:.8rem 0}
// #pad input{background:var(--cream);border:3px solid var(--ink);padding:.5rem;font-family:monospace;font-size:1rem;width:100%}
// .chip{font-family:monospace;font-weight:bold;border:3px solid var(--ink);background:#fff;padding:.4rem .7rem;margin:.2rem;box-shadow:4px 4px 0 var(--ink)}
// .chip.on{background:var(--lava);color:#fff}
// .step{display:inline-flex;align-items:center;gap:.6rem}
// .step button{font-size:1.2rem;border:3px solid var(--ink);background:var(--banana);box-shadow:3px 3px 0 var(--ink);width:2.2rem;height:2.2rem}
// .shake{animation:shk .3s 2}
// @keyframes shk{25%{transform:translateX(-7px) rotate(-1deg)}75%{transform:translateX(7px) rotate(1deg)}}
// .stamp{position:absolute;right:-10px;top:-24px;border:6px double #0a6b2e;color:#0a6b2e;font-family:Impact,"Arial Black",sans-serif;font-size:2rem;text-align:center;padding:.3rem .8rem;transform:rotate(12deg);background:rgba(255,255,255,.9);filter:url(#rough);animation:slam .35s var(--pop)}
// @keyframes slam{from{transform:scale(1.6) rotate(-8deg);opacity:0}}
// .receipt{font-family:monospace;background:var(--cream);border:3px dashed var(--ink);padding:.6rem}
// #lava{position:fixed;inset:0;pointer-events:none;z-index:60}
// #ay{position:fixed;inset:0;display:none;place-items:center;z-index:61;font-family:Impact,"Arial Black",sans-serif;font-size:22vw;color:var(--banana);-webkit-text-stroke:6px var(--ink);text-shadow:12px 12px 0 var(--ink);transform:rotate(-8deg)}
// #ay.show{display:grid}
// .steam{position:fixed;top:20vh;font-size:2rem;color:var(--ink);opacity:0;z-index:5;pointer-events:none;line-height:1}
// body[data-heat="6"] .steam,body[data-heat="7"] .steam,body[data-heat="8"] .steam,body[data-heat="9"] .steam,body[data-heat="10"] .steam{opacity:.5;animation:rise 1.6s linear infinite}
// body[data-heat="8"] .steam,body[data-heat="9"] .steam,body[data-heat="10"] .steam{opacity:.9}
// .steam-l{left:6px}.steam-r{right:6px}
// @keyframes rise{to{transform:translateY(-40px)}}
// .slap-in .m,.slap-in .card,.slap-in .tile,.slap-in .wordmark span{animation:slap .45s var(--pop) backwards}
// .slap-in .m:nth-child(2),.slap-in .wordmark span:nth-child(2){animation-delay:80ms}.slap-in .m:nth-child(3),.slap-in .wordmark span:nth-child(3){animation-delay:120ms}.slap-in .m:nth-child(4),.slap-in .wordmark span:nth-child(4){animation-delay:160ms}.slap-in .m:nth-child(5),.slap-in .wordmark span:nth-child(5){animation-delay:200ms}.slap-in .m:nth-child(6),.slap-in .wordmark span:nth-child(6){animation-delay:240ms}.slap-in .wordmark span:nth-child(n+7){animation-delay:280ms}.cards .card:nth-child(2){animation-delay:120ms}.cards .card:nth-child(3){animation-delay:240ms}
// @keyframes slap{from{transform:scale(1.6) rotate(10deg);opacity:0}}
// @media(prefers-reduced-motion:reduce){*{animation:none!important;transition:background .2s}.track{animation:none}}
//
