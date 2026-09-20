/* Generated artwork is kept intact; this assembles it into functional cursor assets. */
const fs = require('node:fs/promises');
const path = require('node:path');
const sharp = require('sharp');
const root = path.resolve(__dirname, '..');
const sizes = [32, 48, 64, 96, 128];
const shapes = [];
function add(name, aliases, glyph, hot = [16,16], animation = 'static') {
  shapes.push({name, aliases: aliases.split(' ').filter(Boolean), glyph, hot, animation});
}
const arrow = '<path d="M4 4 L4 27 L10 21 L15 31 L20 28 L15 19 L24 19 Z"/>';
const hand = '<path d="M11 26 L6 18 Q4 14 7 13 L11 17 L11 5 Q11 2 14 3 Q16 3 16 6 L16 13 Q19 10 21 14 Q24 12 26 16 Q30 15 30 20 L29 28 L25 32 L15 32 Z"/>';
const text = '<path d="M7 4 H17 M12 4 V28 M7 28 H17" fill="none"/>';
const cross = '<path d="M16 3 V29 M3 16 H29" fill="none"/><circle cx="16" cy="16" r="2" fill="#c2a5f5" stroke="none"/>';
const horizontal = '<path d="M3 16 L9 10 V14 H23 V10 L29 16 L23 22 V18 H9 V22 Z"/>';
function rotation(svg, a) { return `<g transform="rotate(${a} 16 16)">${svg}</g>`; }
const plus = '<path d="M17 6 V26 M7 16 H27" fill="none"/>';
add('left_ptr', 'default arrow top_left_arrow', arrow, [4,4], 'blink');
add('pointer', 'hand hand1 hand2 pointing_hand e29285e634086352946a0e7090d73106 9d800788f1b08800ae810202380a0822', hand, [13,4], 'blink');
add('help', 'question_arrow whats_this left_ptr_help 5c6cd98b3f3ebcb1f9c7f1c204630408 d9ce0ab605698f320427677b458ad60b', arrow + '<circle cx="25" cy="27" r="9" fill="#503d6b"/><path d="M22 24 Q23 20 27 23 Q29 25 25 27 M25 30 V31" fill="none" stroke="#fff8ff"/>', [4,4], 'blink');
add('context-menu', 'context_menu', arrow + '<path d="M21 21 H33 V33 H21 Z"/><path d="M24 24 H30 M24 27 H30 M24 30 H30" fill="none" stroke="#76578e"/>', [4,4]);
add('progress', 'left_ptr_watch half-busy 08e8e1c95fe2fc01f976f1e063a24ccd 3ecb610c1bf2410f44200f48c40d3599', arrow, [4,4], 'spin');
add('wait', 'watch busy', '', [16,16], 'spin');
add('text', 'xterm ibeam', text, [12,16]);
add('vertical-text', 'vertical_text', rotation(text,90), [16,12]);
add('crosshair', 'cross cross_reverse diamond_cross', cross);
add('cell', 'plus', '<path d="M13 4 H19 V13 H28 V19 H19 V28 H13 V19 H4 V13 H13 Z"/>');
add('move', 'fleur size_all all-scroll all_scroll', '<path d="M16 2 L22 8 H18 V14 H24 V10 L30 16 L24 22 V18 H18 V24 H22 L16 30 L10 24 H14 V18 H8 V22 L2 16 L8 10 V14 H14 V8 H10 Z"/>');
add('grab', 'openhand open_hand 5aca4d189052212118709018842178c0 9141b49c8149039304290b508d208c40', '<path d="M9 29 L4 19 Q3 15 6 15 L10 19 L8 8 Q8 5 11 5 L14 16 V4 Q16 1 18 4 L18 15 L21 6 Q24 4 25 8 L22 17 L27 12 Q31 12 29 17 L25 29 Z"/>');
add('grabbing', 'closedhand closed_hand dnd-none 208530c400c041818281048008011002 05e88622050804100c20044008402080', '<path d="M8 27 L5 16 Q5 12 9 13 L11 16 V10 Q13 7 16 11 Q19 7 22 12 Q26 10 28 15 V24 L24 29 H12 Z"/>');
add('not-allowed', 'forbidden crossed_circle circle 03b6e0fcb3499374a867c041f52298f0', '<circle cx="16" cy="16" r="12" fill="#edbedc"/><path d="M8 8 L24 24" fill="none"/>');
add('no-drop', 'no_drop dnd-no-drop', arrow + '<circle cx="25" cy="27" r="8" fill="#edbedc"/><path d="M20 22 L30 32" fill="none"/>', [4,4]);
add('copy', 'dnd-copy 1081e37283d90000800003c07f3ef6bf 640fb0e74195791501fd1ed57b41487f', arrow + '<circle cx="25" cy="27" r="8" fill="#eadbff"/><path d="M25 22 V32 M20 27 H30" fill="none"/>', [4,4]);
add('alias', 'link dnd-link 3085a0e285430894940527032f8b26df a2a266d0498c3104214a47bd64ab0fc8', arrow + '<path d="M19 30 Q19 23 28 24 V20 L34 26 L28 32 V28 Q22 27 19 30 Z"/>', [4,4]);
add('dnd-move', '', arrow + '<path d="M26 20 L32 26 L26 32 M20 26 H32" fill="none"/>', [4,4]);
add('ew-resize', 'sb_h_double_arrow h_double_arrow size_hor h-resize 028006030e0e7ebffc7f7070c0600140', horizontal);
add('ns-resize', 'sb_v_double_arrow v_double_arrow size_ver v-resize 00008160000006810000408080010102', rotation(horizontal,90));
add('nwse-resize', 'bd_double_arrow size_fdiag c7088f0f3e6c8088236ef8e1e3e70000', rotation(horizontal,45));
add('nesw-resize', 'fd_double_arrow size_bdiag fcf1c3c7cd4491d801f1e1c78f100000', rotation(horizontal,-45));
add('col-resize', 'split_h 043a9f68147c53184671403ffa811cc5', horizontal + '<path d="M16 4 V28" fill="none"/>');
add('row-resize', 'split_v 14fef782d02440884392942c11205230', rotation(horizontal + '<path d="M16 4 V28" fill="none"/>',90));
const single = '<path d="M3 16 L11 8 V13 H29 V19 H11 V24 Z"/>';
for(const [n,a,aliases] of [['w',0,'left_side'],['nw',45,'top_left_corner'],['n',90,'top_side'],['ne',135,'top_right_corner'],['e',180,'right_side'],['se',225,'bottom_right_corner'],['s',270,'bottom_side'],['sw',315,'bottom_left_corner']]) add(`${n}-resize`,aliases,rotation(single,a));
for(const [name,sign] of [['zoom-in','<path d="M8 13 H18 M13 8 V18" fill="none"/>'],['zoom-out','<path d="M8 13 H18" fill="none"/>']]) add(name,name.replace('-','_'),'<path d="M21 21 L30 30" fill="none" stroke-width="5"/><circle cx="13" cy="13" r="10" fill="#e6d6fc"/>'+sign,[13,13]);
add('pencil', 'draft', '<path d="M5 29 L7 20 L24 3 L31 10 L14 27 Z"/><path d="M7 20 L14 27 M21 6 L28 13" fill="none"/>', [5,29]);
add('up-arrow', 'center_ptr', '<path d="M16 3 L28 17 H21 V31 H11 V17 H4 Z"/>',[16,3]);

function glyphSVG(shape, phase, umbrella = false) {
  let glyph = shape.glyph;
  if (umbrella) glyph = glyph.replace(arrow, '');
  if(shape.animation === 'spin') {
    const [cx,cy,r] = umbrella || shape.name==='wait' ? [16,16,11] : [26,28,7];
    glyph += `<circle cx="${cx}" cy="${cy}" r="${r}" fill="#352842"/>`;
    for(let k=0;k<8;k++) {
      const a=(k+phase)*Math.PI/4;
      glyph+=`<circle cx="${cx+Math.cos(a)*r*.7}" cy="${cy+Math.sin(a)*r*.7}" r="${r*.18}" fill="${k===0?'#fff7ff':k<4?'#c6a0ff':'#816394'}" stroke="none"/>`;
    }
  }
  // A white outer edge and plum inner edge remain legible on dark and light windows.
  const transform = umbrella ? 'translate(1 39) scale(0.52)' : 'translate(2 2) scale(0.5)';
  return `<svg xmlns="http://www.w3.org/2000/svg" width="256" height="256" viewBox="0 0 64 64"><g transform="${transform}" fill="#f4eaff" stroke-linejoin="round" stroke-linecap="round"><g stroke="#fffaff" stroke-width="4">${glyph}</g><g stroke="#32213f" stroke-width="1.8">${glyph}</g></g></svg>`;
}
function xcursor(frames) {
  const header = Buffer.alloc(16 + frames.length*12);
  header.write('Xcur'); header.writeUInt32LE(16,4); header.writeUInt32LE(0x10000,8); header.writeUInt32LE(frames.length,12);
  let offset=header.length;
  const chunks=frames.map((f,i)=>{
    header.writeUInt32LE(0xfffd0002,16+i*12); header.writeUInt32LE(f.size,20+i*12); header.writeUInt32LE(offset,24+i*12);
    const chunk=Buffer.alloc(36+f.size*f.size*4);
    [36,0xfffd0002,f.size,1,f.size,f.size,...f.hot,f.delay].forEach((n,j)=>chunk.writeUInt32LE(n,j*4));
    for(let p=0;p<f.raw.length;p+=4) {
      const a=f.raw[p+3];
      chunk[36+p]=Math.round(f.raw[p+2]*a/255);
      chunk[37+p]=Math.round(f.raw[p+1]*a/255);
      chunk[38+p]=Math.round(f.raw[p]*a/255);
      chunk[39+p]=a;
    }
    offset+=chunk.length; return chunk;
  });
  return Buffer.concat([header,...chunks]);
}
const variants = [
  { name:'Vivian', source:'source', map:'cursor-map.json', umbrella:false, caption:'Small pointer, larger companion · about 1:3' },
  { name:'Vivian_umbrella', source:'source-umbrella', map:'cursor-map-umbrella.json', umbrella:true, caption:'Compact open canopy · silver tip points up and left' }
];

async function prepareSprites(variant) {
  const atlas = path.join(root,'assets',variant.umbrella?'vivian-umbrella-atlas.png':'vivian-atlas.png');
  const meta = await sharp(atlas).metadata();
  if(!meta.hasAlpha) throw new Error('Expected transparent RGBA artwork');
  if(!variant.umbrella) {
    const sprites=[];
    for(let i=0;i<4;i++) {
      const input=await sharp(atlas).extract({left:meta.width/4*i,top:0,width:meta.width/4,height:meta.height})
        .resize({width:46*4,height:60*4,fit:'inside'}).png().toBuffer();
      sprites.push({input,left:18*4,top:2*4});
    }
    return sprites;
  }
  // Register all atlas cells on the topmost solid pixel of the umbrella ferrule.
  // One common scale preserves frame proportions; only placement changes.
  const cells=[];
  const layout=JSON.parse(await fs.readFile(path.join(root,'assets/umbrella-layout.json'),'utf8'));
  if(meta.width!==layout.atlasSize[0] || meta.height!==layout.atlasSize[1]) throw new Error('Update umbrella-layout.json for the new atlas dimensions');
  for(let i=0;i<4;i++) {
    const rect=layout.frames[i],{width,height}=rect;
    const png=await sharp(atlas).extract(rect).png().toBuffer();
    const raw=await sharp(png).ensureAlpha().raw().toBuffer();
    let minX=width,minY=height,maxX=0,maxY=0;
    for(let y=0;y<height;y++) for(let x=0;x<width;x++) if(raw[(y*width+x)*4+3]>96) {
      minX=Math.min(minX,x);minY=Math.min(minY,y);maxX=Math.max(maxX,x);maxY=Math.max(maxY,y);
    }
    const tipPixels=[];
    for(let x=0;x<width;x++) if(raw[(minY*width+x)*4+3]>96) tipPixels.push(x);
    const tipX=tipPixels[Math.floor(tipPixels.length/2)],tipY=minY;
    const left=Math.max(0,minX-2),top=Math.max(0,minY-2);
    const right=Math.min(width,maxX+3),bottom=Math.min(height,maxY+3);
    cells.push({png,left,top,right,bottom,tipX,tipY});
  }
  const maxBelow=Math.max(...cells.map(c=>c.bottom-c.tipY));
  const maxLeft=Math.max(...cells.map(c=>c.tipX-c.left));
  const maxRight=Math.max(...cells.map(c=>c.right-c.tipX));
  const scale=Math.min(59*4/maxBelow,13*4/maxLeft,45*4/maxRight);
  const sprites=[];
  for(const c of cells) {
    const input=await sharp(c.png).extract({left:c.left,top:c.top,width:c.right-c.left,height:c.bottom-c.top})
      .resize(Math.round((c.right-c.left)*scale),Math.round((c.bottom-c.top)*scale),{fit:'fill'}).png().toBuffer();
    const left=16*4-Math.round((c.tipX-c.left)*scale);
    const top=3*4-Math.round((c.tipY-c.top)*scale);
    sprites.push({input,left,top});
  }
  return sprites;
}

async function buildVariant(variant) {
  const sprites=await prepareSprites(variant);
  const theme=path.join(root,variant.name),source=path.join(root,variant.source);
  await fs.mkdir(path.join(theme,'cursors'),{recursive:true});
  await fs.mkdir(path.join(source,'hyprcursors'),{recursive:true});
  const manifest=`name = ${variant.name}\ndescription = ${variant.caption}\nversion = 1.2.0\ncursors_directory = hyprcursors\n`;
  await fs.writeFile(path.join(theme,'manifest.hl'),manifest);
  await fs.writeFile(path.join(source,'manifest.hl'),manifest);
  await fs.writeFile(path.join(theme,'index.theme'),`[Icon Theme]\nName=${variant.name}\nComment=${variant.caption}\nInherits=Adwaita\n`);
  const records=[];
  for(const shape of shapes) {
    const hot=variant.umbrella?[16,3]:shape.hot.map(c=>2+c*.5);
    const folder=path.join(source,'hyprcursors',shape.name);
    await fs.mkdir(folder,{recursive:true});
    let metadata=`resize_algorithm = bilinear\nhotspot_x = ${hot[0]/64}\nhotspot_y = ${hot[1]/64}\n`;
    metadata+=shape.aliases.map(a=>`define_override = ${a}\n`).join('');
    const animation=shape.animation==='blink'?[[0,1400],[1,280],[2,120],[3,1000]]:shape.animation==='spin'?Array.from({length:8},(_,i)=>[i,90]):[[0,1000]];
    const frames=[];
    for(const size of sizes) for(let j=0;j<animation.length;j++) {
      const [phase,delay]=animation[j];
      const sprite=sprites[shape.animation==='blink'?phase:0];
      const composed=await sharp({create:{width:256,height:256,channels:4,background:'#00000000'}})
        .composite([sprite,{input:Buffer.from(glyphSVG(shape,phase,variant.umbrella)),left:0,top:0}]).png().toBuffer();
      const png=await sharp(composed).resize(size,size).png().toBuffer();
      const filename=`${size}-${String(j).padStart(2,'0')}.png`;
      await fs.writeFile(path.join(folder,filename),png);
      const raw=await sharp(png).ensureAlpha().raw().toBuffer();
      frames.push({size,hot:hot.map(v=>Math.floor(v*size/64+.5)),delay,raw});
      metadata+=`define_size = ${size}, ${filename}, ${delay}\n`;
    }
    await fs.writeFile(path.join(folder,'meta.hl'),metadata);
    await fs.writeFile(path.join(theme,'cursors',shape.name),xcursor(frames));
    for(const alias of shape.aliases) {
      const dest=path.join(theme,'cursors',alias);
      try {await fs.unlink(dest);} catch(e) {if(e.code!=='ENOENT') throw e;}
      await fs.symlink(shape.name,dest);
    }
    records.push({...shape,hot,frames:animation.length,delays:animation.map(x=>x[1])});
  }
  await fs.writeFile(path.join(root,variant.map),JSON.stringify({theme:variant.name,source:variant.source,sizes,shapes:records},null,2)+'\n');
  console.log(`Built ${variant.name}: ${records.length} shapes, ${sizes.join(', ')} px.`);
  return {...variant,records};
}

async function preview(all) {
  let svg='<svg xmlns="http://www.w3.org/2000/svg" width="1440" height="1100" viewBox="0 0 1440 1100"><rect width="1440" height="1100" fill="#17121e"/><circle cx="1390" cy="0" r="440" fill="#241c30"/><text x="64" y="64" font-family="Arial" font-size="14" letter-spacing="4" fill="#c9a7eb">VIVIAN / TWO WAYS TO POINT</text><text x="60" y="146" font-family="Georgia" font-size="68" fill="#f4eafa">A companion for every click.</text><text x="65" y="194" font-family="Arial" font-size="20" fill="#b6a4c4">Hyprcursor + XCursor · 36 shapes each · 32 / 48 / 64 / 96 / 128 px</text>';
  const picks=['left_ptr','pointer','text','wait','copy','ew-resize'];
  for(let row=0;row<all.length;row++) {
    const variant=all[row],baseY=245+row*385;
    svg+=`<text x="64" y="${baseY+36}" font-family="Georgia" font-size="37" fill="#f1e6fa">${variant.name}</text><text x="${row===0?225:410}" y="${baseY+33}" font-family="Arial" font-size="17" fill="#bca8cd">${variant.caption.replace(' · ',' / ')}</text>`;
    for(let i=0;i<picks.length;i++) {
      const x=64+i*220,y=baseY+62,light=i>=3;
      const png=await fs.readFile(path.join(root,variant.source,'hyprcursors',picks[i],'128-00.png'));
      svg+=`<rect x="${x}" y="${y}" width="208" height="242" rx="17" fill="${light?'#eee7f5':'#2b2335'}"/><image x="${x+24}" y="${y+14}" width="160" height="160" href="data:image/png;base64,${png.toString('base64')}"/><text x="${x+20}" y="${y+218}" font-family="Arial" font-size="15" fill="${light?'#4b395f':'#d7c8e6'}">${i===0?'Default':picks[i].replaceAll('_',' ')}</text>`;
    }
    svg+=`<text x="64" y="${baseY+342}" font-family="Arial" font-size="15" fill="#bca8cd">${row===0?'Arrow and symbols reduced; character fills more of the canvas.':'The silver point at the upper left of the open canopy is the hotspot in every state.'}</text>`;
  }
  svg+='<text x="64" y="1060" font-family="Arial" font-size="15" fill="#a996bb">Artwork enlarged for comparison. Choose 64 px for the desktop; 96 px for more character detail.</text></svg>';
  await fs.writeFile(path.join(root,'preview.svg'),svg);
  await sharp(Buffer.from(svg)).png().toFile(path.join(root,'preview.png'));
  const data=all.map(v=>({name:v.name,source:v.source,caption:v.caption,records:v.records}));
  const html=`<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Vivian cursor variants</title><style>body{margin:0;background:#17131f;color:#efe6fa;font:16px system-ui}main{max-width:1080px;margin:50px auto;padding:24px}h1{font:64px Georgia;margin:10px 0}p{color:#bcaecb;line-height:1.6}.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(150px,1fr));gap:12px}.card{background:#2a2237;color:#dfcfef;border:1px solid #483752;border-radius:14px;min-height:125px;display:grid;place-items:center;padding:14px;font:13px system-ui}.card.active{border-color:#d9b4ff}.card img{width:64px;height:64px}.demo{padding:36px;background:#ece4f3;color:#392c49;border-radius:14px;margin:24px 0;min-height:110px}.controls{display:flex;gap:20px;align-items:center;flex-wrap:wrap}select,button{font:inherit}small{color:#b9a5ca}</style><main><small>ZENLESS ZONE ZERO / FAN ART</small><h1>Vivian, twice.</h1><p>Choose a theme and cursor, then move over the pale panel. Both variants use the exact packaged frames and click points.</p><div class="controls"><label>Theme <select id="theme"><option>Vivian</option><option>Vivian_umbrella</option></select></label><label>Size <select id="size"><option>32</option><option>48</option><option selected>64</option><option>96</option><option>128</option></select></label><label><input type="checkbox" id="animate" checked> Animation</label></div><p id="caption"></p><div class="demo" id="demo">Try your cursor here.<br><br>In Vivian_umbrella, the silver crown tip is the click point. The small state badge is only an indicator.</div><div class="grid" id="grid"></div><p>Both themes are included in the default Nix package. See README.md for installation.</p></main><script>const variants=${JSON.stringify(data)},demo=document.querySelector('#demo'),size=document.querySelector('#size');let variant=variants[0],selected=variant.records[0],frame=0,timer;function render(){clearTimeout(timer);const n=+size.value;demo.style.cursor='url("'+variant.source+'/hyprcursors/'+selected.name+'/'+n+'-'+String(frame).padStart(2,'0')+'.png") '+Math.round(selected.hot[0]*n/64)+' '+Math.round(selected.hot[1]*n/64)+', auto';if(document.querySelector('#animate').checked&&selected.frames>1)timer=setTimeout(()=>{frame=(frame+1)%selected.frames;render()},selected.delays[frame]);}function grid(){document.querySelector('#caption').textContent=variant.caption;document.querySelector('#grid').innerHTML=variant.records.map(s=>'<button class="card" data-name="'+s.name+'"><img src="'+variant.source+'/hyprcursors/'+s.name+'/64-00.png"><span>'+s.name+'</span></button>').join('');document.querySelectorAll('.card').forEach(b=>{b.classList.toggle('active',b.dataset.name===selected.name);b.onclick=()=>{selected=variant.records.find(s=>s.name===b.dataset.name);frame=0;document.querySelectorAll('.card').forEach(x=>x.classList.toggle('active',x===b));render()}})}document.querySelector('#theme').onchange=e=>{const name=selected.name;variant=variants.find(v=>v.name===e.target.value);selected=variant.records.find(s=>s.name===name);frame=0;grid();render()};size.onchange=()=>{frame=0;render()};document.querySelector('#animate').onchange=()=>{frame=0;render()};grid();render();</script></html>`;
  await fs.writeFile(path.join(root,'preview.html'),html);
}

async function main() {
  const all=[];
  for(const variant of variants) all.push(await buildVariant(variant));
  await preview(all);
}
main().catch(e=>{console.error(e);process.exit(1)});
