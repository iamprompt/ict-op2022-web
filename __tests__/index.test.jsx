import { render, screen } from '@testing-library/react'
import '@testing-library/jest-dom'

import { checkAnswer } from 'src/modules/api/services/activity/checkAnswer'
import { getQuestQuestion, formatQuestion } from 'src/modules/api/services/activity/getQuestQuestion'
import { QUESTIONS, QUESTION_TYPE } from '../src/const/activity/questions'
describe('register-unit-tests.ts', () => {

  /**
   * Test check answer.
   */
  it('testCheckAnswer', async () => {
    expect(checkAnswer('MUICT', 'MUICT')).true;
    expect(checkAnswer('', 'MUICT')).not.true;
    expect(checkAnswer(["MUICT", "LA"], [""])).not.true;
    expect(checkAnswer('MUICT', 'LA')).not.true;

  });

  /**
   * Test get quest question.
   */
  it('testGetQuestQuestion', async () => {
    let expectedOutput = [{
      id: 'Q1',
      type: 'TEXT_FIELD',
      questNo: 2,
      questTitle: 'Meet & Greet Zone',
      question: 'จำนวนชมรม (Club) ที่จัดแสดงมีกี่ชมรม', expectedAnswer:
        ['4', 'four', 'สี่', '4 ชมรม', '4 clubs', 'four clubs', '4 club', 'four club',]
    }];
    expect(await getQuestQuestion(2, 'th', true, true)).toMatchObject(expectedOutput)

    try {
      await getQuestQuestion(6, 'th', true, true)
    } catch (e) {
      expect(e.message).toBe("Question not found");
    }

    try {
      await getQuestQuestion(-1, 'th', true, true)
    } catch (e) {
      expect(e.message).toBe("Question not found");
    }

    expectedOutput = [{
      id: 'Q1',
      type: 'TEXT_FIELD',
      questNo: 2,
      questTitle: 'Meet & Greet Zone',
      question: 'How many clubs do we have for the open house?',
      expectedAnswer:
        ['4', 'four', 'สี่', '4 ชมรม', '4 clubs', 'four clubs', '4 club', 'four club',]
    }];

    expect(await getQuestQuestion(2, 'en', true, true)).toMatchObject(expectedOutput)

    expectedOutput = [{
      id: 'Q1',
      type: 'TEXT_FIELD',
      questNo: 2,
      questTitle: undefined,
      question: undefined,
      expectedAnswer:
        ['4', 'four', 'สี่', '4 ชมรม', '4 clubs', 'four clubs', '4 club', 'four club',]
    }];

    expect(await getQuestQuestion(2, 'jp', true, true)).toMatchObject(expectedOutput)

    expectedOutput = [{
      id: 'Q1',
      type: 'TEXT_FIELD',
      questNo: 2,
      questTitle: 'Meet & Greet Zone',
      question: 'จำนวนชมรม (Club) ที่จัดแสดงมีกี่ชมรม', 
    }];

    expect(await getQuestQuestion(2, 'th', true, false)).toMatchObject(expectedOutput)

    expectedOutput = [{
      id: 'Q1',
      type: 'TEXT_FIELD',
      questNo: 2,
      questTitle: 'Meet & Greet Zone',
      expectedAnswer:
        ['4', 'four', 'สี่', '4 ชมรม', '4 clubs', 'four clubs', '4 club', 'four club',]
    }];

    expect(await getQuestQuestion(2, 'th', false, true)).toMatchObject(expectedOutput)
    await getQuestQuestion(5,'th',false,false);
    await getQuestQuestion(3);
    //  const id = q[0].id;
    //  expect(id).toBe("Q1");

    //  let q5 = await getQuestQuestion(5,'th',false,false);
    //  let id5 = q5[0].id;
    //  expect(id5).toBe("Q5");

    //  q5 = await getQuestQuestion(5,'th',true,true);
    //  id5 = q5[0].id;
    //  expect(id5).toBe("Q5");

    //  q5 = await getQuestQuestion(3);

    //  try {
    //      await getQuestQuestion(13,'th',true,true)
    //  } catch (e) {
    //      expect(e.message).toBe("Question not found");
    //  }
    
  })

  it('test mocking', async () => {
    // const q = QUESTIONS.filter(element => {
    //   console.log(element)
    // });
    console.log(QUESTIONS.length);
  });
})
export { };