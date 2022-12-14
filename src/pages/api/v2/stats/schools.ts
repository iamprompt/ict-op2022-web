import type { NextApiRequest, NextApiResponse } from 'next'
import { getParticipants } from '~/modules/api-v2/usecases'
import { apiKeyAuthenticated } from '~/modules/api-v2/utils/apiKeyAuthenticated'
import { allowCors } from '~/modules/api-v2/utils/cors'

const API = async (req: NextApiRequest, res: NextApiResponse) => {
  try {
    await allowCors(req, res)
    const [, isSuperPrivileged] = await apiKeyAuthenticated(req, res)

    const participants = await getParticipants()

    const schools = participants.reduce((acc, participant) => {
      const { school } = participant

      const cleanedSchoolName = school
        ?.replace(/โร[งว]?เร([ีั]?)ย?น?/g, '')
        .replace(/ร.?ร./g, '')
        .replace('เเ', 'แ')
        .replace(/[-_]/g, '')
        .trim()
        .toLowerCase()

      if (!cleanedSchoolName || cleanedSchoolName === '') {
        return acc
      }

      if (!acc[cleanedSchoolName]) {
        acc[cleanedSchoolName] = {
          school: cleanedSchoolName,
          count: 0,
          participants: isSuperPrivileged ? [] : undefined,
        }
      }

      isSuperPrivileged && acc[cleanedSchoolName].participants.push(participant)
      acc[cleanedSchoolName].count += 1

      return acc
    }, {} as Record<string, number>)

    const schoolParticipants = Object.values(schools).sort(
      (a, b) => b.count - a.count
    )

    return res.status(200).json({
      success: true,
      // payload: schools,
      payload: schoolParticipants,
    })
  } catch (error: any) {
    return res.status(500).json({
      success: false,
      payload: {
        message: error.message,
      },
    })
  }
}

export default API
