import type { NextApiRequest, NextApiResponse } from 'next'
import { registerSchema } from '~/modules/api/schema/register.input.schema'
import { registerUser } from '~/modules/api/services/register'

const API = async (req: NextApiRequest, res: NextApiResponse) => {
  try {
    if (req.method === 'POST') {
      const { authorization } = req.headers
      const token = authorization?.split(/\s/g)[1]

      const { body } = req
      await registerSchema.validateAsync(body)
      await registerUser(body, token)

      return res.status(200).json({ message: 'OK' })
    }

    return res.status(405).json({ message: 'Method Not Allowed' })
  } catch (error: any) {
    res.status(500).json({ message: error.message })
  }
}

export default API
