import { HMRouter } from "@hadss/hmrouter"
import { PageUrl } from "../constants/pageUrl"

@HMRouter({ pageUrl:PageUrl.Study })
@ComponentV2
export struct Study {
  build() {
    Column() {
      Text('Study')
    }.width($r('app.string.w_full')).height($r('app.string.h_full')).justifyContent(FlexAlign.Center)
  }
}

