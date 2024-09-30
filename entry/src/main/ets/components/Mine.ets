import { HMRouter, HMRouterMgr } from "@hadss/hmrouter"
import { PageUrl } from "../constants/pageUrl"

@HMRouter({ pageUrl:PageUrl.Mine })
@ComponentV2
export struct Mine {
  params = HMRouterMgr.getCurrentParam()

  build() {
    Column() {
       Text('我的')
      Text(JSON.stringify(this.params))
      Button('返回首页').onClick(()=>{
        HMRouterMgr.pop()
      })
    }.width($r('app.string.w_full')).height($r('app.string.h_full')).justifyContent(FlexAlign.Center)
  }
}