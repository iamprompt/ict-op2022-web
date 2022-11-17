## 1. testCheckAnswer
Description
1. **Identify testable functions** : `checkAnswer`
2.
    - **Identify parameters** : `expectedAnswer(String), answer(String)`
    - **return types** : `String`
    - **return values**: `String`
    - **exceptional behavior** :``
3. **Model the input domain**(The characteristics developed for this test case using the techniques from Input Space Partitioning. You must create **at least** one interface-based characteristic and **at least** one functionality-based characteristic for each test case.)  
   Characteristics:

| Characteristics                 | b1   | b2           | b3  |
| ------------------------------- | ---- | ------------ | --- |
| size of expectedAnswer          | 0    | at least one |     |
| size of answer                  | 0    | at least one |     |
| expectdAnswer is same as answer | True | False        |     |
1. Combine partitions to define test requirements - use the 5 approaches to find combinations of values (ACoC, ECC, PWC, BCC, MBCC). You must apply the 5 approaches to your 10 unit test cases (thus each approach will be used in 2 unit test cases).  
   Approaches :   BCC
   Test requirements : 1+[(2-1)+(2-1)+(2-1)] = 4    
   Test cases: (at least one, at least one,T) base choice, (0, at least one,T),(at least one, 0,T),(at least one, at least one,F)
2. Derive test values and expected values. These are the
   values that you have to use when you implement test cases in JUnit.

| Test                              | expectedAnswer | answer  | Expected result |
| --------------------------------- | -------------- | ------- | --------------- |
| T1:(at least one, at least one,T) | "MUICT"        | "MUICT" | True            |
| T1:(0, at least one,T)            | ""             | "MUICT" | False           |
| T1:(at least one, 0,T)            | ["MUICT","LA"] | ""      | False           |
| T1:(at least one, at least one,F) | "MUICT"        | "LA"    | False           |

## 2. testGetQuestQuestion
Description
1. **Identify testable functions** : `getQuestQuestion`
2.
    - **Identify parameters** : `questNo(Integer), lang(String), question(Boolean), answer(Boolean)`
    - **return types** : `Object`
    - **return values**: `list of questions`
    - **exceptional behavior** :``
1. **Model the input domain**(The characteristics developed for this test case using the techniques from Input Space Partitioning. You must create **at least** one interface-based characteristic and **at least** one functionality-based characteristic for each test case.)  
   Characteristics:

| Characteristics             | b1   | b2    | b3                |
| --------------------------- | ---- | ----- | ----------------- |
| questNo is in range of list | 0-5  | >5    | <0                |
| lang is valid.              | th   | en    | neither th nor en |
| question is allow           | True | False |                   |
| answer is allow             | True | False |                   |
1. Combine partitions to define test requirements - use the 5 approaches to find combinations of values (ACoC, ECC, PWC, BCC, MBCC). You must apply the 5 approaches to your 10 unit test cases (thus each approach will be used in 2 unit test cases).  
   Approaches :   BCC
   Test requirements : 1+[(3-1)+(3-1)+(2-1)+(2-1)] = 7    
   Test cases: 
   (2,th,true,true) base choice,
   (6,th,true,true)
   (-2,th,true,true)
   (2,en,true,true), (2,jp,true,true)
   (2,th,true,false)
   (2,th,false,true)
2. Derive test values and expected values. These are the
   values that you have to use when you implement test cases in JUnit.

| Test                 | questNo | lang | question | answer | Expected result                                                                                                                                                                                                                |
| -------------------- | ------- | ---- | -------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| T1:(2,th,true,true)  | 2       | th   | true    | true  | [{id: 'Q1',type: 'TEXT_FIELD',questNo: 2,questTitle: 'Meet & Greet Zone',question: 'จำนวนชมรม (Club) ที่จัดแสดงมีกี่ชมรม', expectedAnswer: ['4','four','สี่','4 ชมรม','4 clubs','four clubs','4 club','four club',]} ]                  |
| T1:(6,th,true,true)  | 6       | th   | true    | true  | Expection "Question not found"                                                                                                                                                                                                 |
| T1:(-1,th,true,true) | -1      | th   | true    | true  | Expection "Question not found"                                                                                                                                                                                                 |
| T1:(2,en,true,true)  | 2       | en   | true    | true  | [{id: 'Q1',type: 'TEXT_FIELD',questNo: 2,questTitle: 'Meet & Greet Zone', question: 'How many clubs do we have for the open house?', expectedAnswer: ['4','four','สี่','4 ชมรม','4 clubs','four clubs','4 club','four club',]} ] |
| T1:(2,jp,true,true)  | 2       | jp   | true    | true  | [{id: 'Q1',type: 'TEXT_FIELD',questNo: 2,questTitle: undefined, question: undefined, expectedAnswer: undefined}  ]                                                                                                             |
| T1:(2,th,true,false) | 2       | th   | true     | false  | [{id: 'Q1',type: 'TEXT_FIELD',questNo: 2,questTitle: 'Meet & Greet Zone', question: 'จำนวนชมรม (Club) ที่จัดแสดงมีกี่ชมรม'}      ]                                                                                                    |
| T1:(2,th,false,true) | 2       | th   | true     | false  | [ {id: 'Q1',type: 'TEXT_FIELD',questNo: 2,questTitle: 'Meet & Greet Zone', expectedAnswer: ['4','four','สี่','4 ชมรม','4 clubs','four clubs','4 club','four club',],}                                                    ]       |

