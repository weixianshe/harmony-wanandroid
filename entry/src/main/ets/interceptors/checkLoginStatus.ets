import { HMInterceptor, HMInterceptorAction, HMInterceptorInfo, HMRouterMgr, IHMInterceptor } from "@hadss/hmrouter";
import { PageUrl } from "../constants/pageUrl";

@HMInterceptor({ interceptorName:'checkLoginStatus' })
export class CheckLoginStatus implements IHMInterceptor{
  handle(info: HMInterceptorInfo): HMInterceptorAction {
    const isLogin = AppStorage.get('isLogin') as boolean
    if(!!isLogin) {
      return HMInterceptorAction.DO_NEXT
    } else {
      console.log('wt:', '拦截了')
      info.context.getPromptAction().showToast({
        message:'请先登录!!!'
      })
      HMRouterMgr.push({
        pageUrl:PageUrl.Login,
        skipAllInterceptor:true
      })
      return HMInterceptorAction.DO_REJECT
    }
  }
}