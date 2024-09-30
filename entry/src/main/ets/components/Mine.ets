import { HMRouter } from "@hadss/hmrouter"
import { PageUrl } from "../constants/pageUrl"

@HMRouter({ pageUrl:PageUrl.Mine, interceptors:['checkLoginStatus'] })
@ComponentV2
export struct Mine {
  build() {
    Column() {
       Text('我的')
    }.width($r('app.string.w_full')).height($r('app.string.h_full')).justifyContent(FlexAlign.Center)
  }
}