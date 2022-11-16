import { render, screen } from '@testing-library/react'
import '@testing-library/jest-dom'

import {checkAnswer} from 'src/modules/api/services/activity/checkAnswer'
import {getQuestQuestion} from 'src/modules/api/services/activity/getQuestQuestion'
import {getLineUserFromIdToken} from 'src/modules/external/line'
import QuestLog from 'src/modules/mongoose/models/questlog.model'

const mockingoose = require('mockingoose');

describe('register-unit-tests.ts',() => {

  /**
   * Test check answer.
   */
  it('testCheckAnswer', async () => {
    expect(checkAnswer("123",'123')).true;
  });

  /**
   * Test get quest question.
   */
  it('testGetQuestQuestion', async () => {
    const q = await getQuestQuestion(2,'th',false,false);
    const id = q[0].id;
    expect(id).toBe("Q1");
  })

  it('test mocking', async () => {
    
  });
})
export {};