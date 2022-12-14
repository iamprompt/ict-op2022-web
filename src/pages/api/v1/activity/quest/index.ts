import Joi from 'joi'
import type { NextApiRequest, NextApiResponse } from 'next'
import { getQuestQuestion } from '~/modules/api/services/activity/getQuestQuestion'

const API = async (req: NextApiRequest, res: NextApiResponse) => {
  try {
    const { query } = req

    await Joi.object({
      questNo: Joi.string().required(),
      lang: Joi.string().valid('th', 'en').optional(),
    }).validateAsync(query)

    const { questNo, lang = 'th' } = query as {
      questNo: string
      lang: 'th' | 'en'
    }

    if (!questNo) {
      return res.status(400).json({
        message: 'Missing id',
      })
    }

    if (req.method === 'GET') {
      const questions = await getQuestQuestion(
        Number(questNo),
        lang,
        false,
        false
      )

      return res.status(200).json({
        success: true,
        payload: {
          ...questions[0],
          id: undefined,
        },
      })
    }

    return res.status(405).json({
      error: 'Method not allowed',
    })
  } catch (error: any) {
    return res.status(500).json({ message: error.message })
  }
}

export default API
