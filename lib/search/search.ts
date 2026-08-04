export type KnowledgeItem={id:string;title:string;summary:string;content:string;keywords:string[];department:string;category:string;status:"draft"|"in_review"|"approved"|"published"|"archived";visibility:"all_staff"|"department"|"manager"|"admin"|"restricted";source:string;owner:string;version:string;updatedAt:string};
export type SearchResult={item:KnowledgeItem;score:number;confidence:"exact"|"strong"|"related"};
const synonymGroups=[["เบิกเงิน","เบิกค่าใช้จ่าย","สำรองจ่าย","reimbursement"],["pos เสีย","เครื่องคิดเงินใช้ไม่ได้","แจ้งซ่อม pos"],["วันหยุด","holiday"],["ลาป่วย","ใบลา","leave"],["โลโก้","brand assets","ขอโลโก้"],["แจ้งซ่อม","repair request","ซ่อมบำรุง"]];
export function normalize(input:string){return input.toLocaleLowerCase("th-TH").normalize("NFKC").replace(/[\u200B-\u200D\uFEFF]/g,"").replace(/[^\p{L}\p{M}\p{N}\s]/gu," ").replace(/\s+/g," ").trim()}
function expand(q:string){const out=new Set([q]);for(const group of synonymGroups){if(group.some(x=>q.includes(normalize(x))))group.forEach(x=>out.add(normalize(x)))}return [...out]}
function distance(a:string,b:string){if(Math.abs(a.length-b.length)>2)return 99;const d=Array.from({length:a.length+1},(_,i)=>[i]);for(let j=1;j<=b.length;j++)d[0][j]=j;for(let i=1;i<=a.length;i++)for(let j=1;j<=b.length;j++)d[i][j]=Math.min(d[i-1][j]+1,d[i][j-1]+1,d[i-1][j-1]+(a[i-1]===b[j-1]?0:1));return d[a.length][b.length]}
export function searchKnowledge(raw:string,items:KnowledgeItem[],department?:string):SearchResult[]{
 const q=normalize(raw);if(!q)return[];const terms=expand(q);
 return items.filter(x=>x.status==="published"&&x.visibility==="all_staff"&&(!department||x.department===department)).map(item=>{
  const title=normalize(item.title),summary=normalize(item.summary),content=normalize(item.content),keywords=item.keywords.map(normalize);let score=0;
  for(const term of terms){if(title===term)score=Math.max(score,100);if(title.includes(term))score=Math.max(score,80);if(keywords.includes(term))score=Math.max(score,75);if(summary.includes(term))score=Math.max(score,55);if(content.includes(term))score=Math.max(score,35);for(const word of term.split(" ")){if(word.length>2&&title.includes(word))score+=8;if(keywords.some(k=>k.includes(word)))score+=6;if(word.length>=5&&keywords.some(k=>distance(word,k)<=1))score+=4}}
  return{item,score};
 }).filter(x=>x.score>=20).sort((a,b)=>b.score-a.score).map(({item,score})=>({item,score,confidence:score>=90?"exact":score>=50?"strong":"related"}));
}
