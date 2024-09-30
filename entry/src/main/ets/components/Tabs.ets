import { HMRouter, HMRouterMgr } from "@hadss/hmrouter"
import { PageUrl } from "../constants/pageUrl"
import { Home } from "./Home"
import { Mine } from "./Mine"
import { Square } from "./Square"
import { Study } from "./Study"

@HMRouter({ pageUrl:PageUrl.TabPage })
@ComponentV2
export struct TabPage {
  @Local currentIndex:number = 0
  @Builder buildTab(title:string,index:number, icon:Resource, selectIcon:Resource) {
    Column(){
      Image(this.currentIndex === index ? selectIcon : icon).width(24).height(24).margin({
        bottom:4
      })
      Text(title).fontColor(this.currentIndex === index ? $r('app.color.primary') : '#6B6B6B')
    }.height(50).width($r('app.string.w_full'))
  }
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }){
        TabContent(){
          Home()
        }.tabBar(this.buildTab('首页',0, $rawfile('home.png'),$rawfile('home_select.png')))
        TabContent(){
          Study()
        }.tabBar(this.buildTab('学习',1,$rawfile('study.png'),$rawfile('study_select.png')))
        TabContent(){
          Square()
        }.tabBar(this.buildTab('广场',2,$rawfile('square.png'),$rawfile('square_select.png')))
        TabContent(){
          Mine()
        }.tabBar(this.buildTab('我的',3,$rawfile('mine.png'),$rawfile('mine_select.png')))
      }.barHeight(56).barWidth($r('app.string.w_full')).barMode(BarMode.Fixed).scrollable(false).onChange((index)=>{
        this.currentIndex = index
      })
    }.width($r('app.string.w_full')).height($r('app.string.h_full'))
  }
}