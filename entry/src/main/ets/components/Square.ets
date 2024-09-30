import { HMRouter } from "@hadss/hmrouter"
import { PageUrl } from "../constants/pageUrl"

@HMRouter({ pageUrl:PageUrl.Square })
@ComponentV2
export struct Square {

  build() {
    Column() {
      Text('Square')
    }.width($r('app.string.w_full')).height($r('app.string.h_full')).justifyContent(FlexAlign.Center)
  }
}

