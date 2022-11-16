import { render, screen } from '@testing-library/react'
import '@testing-library/jest-dom'

import {checkAnswer} from 'src/modules/api/services/activity/checkAnswer'
import {getQuestQuestion} from 'src/modules/api/services/activity/getQuestQuestion'

describe('register-unit-tests.ts',() => {

  /**
   * Test check answer.
   */
  it('testCheckAnswer', async () => {
    expect(checkAnswer("123",'123')).true;
    expect(checkAnswer(["123","234"],["123","234"])).true;
  });

  /**
   * Test get quest question.
   */
  it('testGetQuestQuestion', async () => {
    const q = await getQuestQuestion(2,'th',false,false);
    const id = q[0].id;
    expect(id).toBe("Q1");

    let q5 = await getQuestQuestion(5,'th',false,false);
    let id5 = q5[0].id;
    expect(id5).toBe("Q5");

    q5 = await getQuestQuestion(5,'th',true,true);
    id5 = q5[0].id;
    expect(id5).toBe("Q5");

    q5 = await getQuestQuestion(3);

    try {
        await getQuestQuestion(13,'th',true,true)
    } catch (e) {
        expect(e.message).toBe("Question not found");
    }

  })

  it('test mocking', async () => {

  });
})
export {};