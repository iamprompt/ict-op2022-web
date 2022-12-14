import { getUserRecordFromLineUId } from '../common/getUserRecordFromLine'
import { getLineUserFromIdToken } from '~/modules/external/line'

const isParticipantRegistered = async (token?: string) => {
  try {
    if (!token) {
      return false
    }

    const user = await getLineUserFromIdToken(token)
    const userRecord = await getUserRecordFromLineUId(user.userId)

    if (!userRecord) {
      return false
    }

    return true
  } catch (error: any) {
    throw new Error(error)
  }
}

export default isParticipantRegistered
