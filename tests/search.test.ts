import test from "node:test";import assert from "node:assert/strict";import {searchKnowledge,normalize} from "../lib/search/search";import {testKnowledge} from "../data/seed/test-knowledge";
test("normalizes Thai and punctuation",()=>assert.equal(normalize("  POS—เสีย!!  "),"pos เสีย"));
for(const q of ["เบิกเงิน","ขอเบิกค่าใช้จ่าย","สำรองจ่ายแล้วทำยังไง"]){test(`ACC search: ${q}`,()=>assert.equal(searchKnowledge(q,testKnowledge)[0]?.item.department,"ACC"))}
for(const q of ["POS เสีย","เครื่องคิดเงินใช้ไม่ได้"]){test(`IT search: ${q}`,()=>assert.equal(searchKnowledge(q,testKnowledge)[0]?.item.department,"IT"))}
test("holiday search",()=>assert.equal(searchKnowledge("วันหยุด",testKnowledge)[0]?.item.department,"HR"));
test("no result returns empty",()=>assert.deepEqual(searchKnowledge("ข้อมูลที่ไม่มีอยู่ xyz",testKnowledge),[]));
test("never exposes draft",()=>assert.ok(searchKnowledge("ข้อมูลร่างที่ห้ามแสดง",testKnowledge).every(x=>x.item.status==="published")));
test("restricted records are filtered",()=>assert.ok(searchKnowledge("POS เสีย",[...testKnowledge,{...testKnowledge[0],id:"restricted",visibility:"restricted"}]).every(x=>x.item.visibility==="all_staff")));
