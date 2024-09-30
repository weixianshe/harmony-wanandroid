import { HMRouter, HMRouterMgr } from "@hadss/hmrouter"
import { PageUrl } from "../constants/pageUrl"

@HMRouter({ pageUrl:PageUrl.Login })
@ComponentV2
export struct Login {
  params = HMRouterMgr.getCurrentParam()

  build() {
    Column() {
      Text('登录')
      Text(JSON.stringify(this.params))

      Button('模拟登录').onClick(()=>{
        AppStorage.setOrCreate('isLogin', true)
        HMRouterMgr.replace({
          pageUrl:PageUrl.Home
        })
      })
    }.width($r('app.string.w_full')).height($r('app.string.h_full')).justifyContent(FlexAlign.Center)
  }
}