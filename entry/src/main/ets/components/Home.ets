import { HMRouter, HMRouterMgr } from "@hadss/hmrouter"
import { ListView, RefreshController, RefreshDataSource } from '@abner/refresh'
import { PageUrl } from "../constants/pageUrl"

@HMRouter({ pageUrl:PageUrl.Home })
@ComponentV2
export struct Home {
  controller: RefreshController = new RefreshController()
  dataSource:RefreshDataSource = new RefreshDataSource()

  @Builder itemLayout(item:Object, index:number) {
     Column(){
       Text(JSON.stringify(item))
     }.height('50').width($r('app.string.w_full'))
  }
  build() {
    Column() {
      ListView({
        lazyDataSource:this.dataSource,
        controller:this.controller,
        itemLayout:(item,index)=> this.itemLayout(item,index),
        onRefresh:()=>{
          console.log('wt:','下拉刷新')
          this.controller.finishRefresh()
        },
        onLoadMore:()=>{
          console.log('wt:','上啦加载')
          this.controller.finishLoadMore()
        }
      })
      // Text('首页')
      // Button('模拟取消登录').onClick(()=>{
      //   AppStorage.delete('isLogin')
      //   HMRouterMgr.replace({
      //     pageUrl:PageUrl.Login
      //   })
      // })
      // Button('go mine').onClick(()=>{
      //   HMRouterMgr.push({
      //     pageUrl:PageUrl.Mine,
      //     param:{
      //       id:"我是首页传递的参数"
      //     }
      //   })
      // })
    }.width($r('app.string.w_full')).height($r('app.string.h_full')).justifyContent(FlexAlign.Center)
  }
}

