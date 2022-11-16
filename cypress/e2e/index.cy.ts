
import {checkAnswer} from 'src/modules/api/services/activity/checkAnswer'
import {getQuestQuestion} from 'src/modules/api/services/activity/getQuestQuestion'



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
    expect(id).equals("Q1");
  })

  it('test mocking', async () => {

  });
})
export {};