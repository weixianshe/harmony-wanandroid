import { HMRouter } from "@hadss/hmrouter"
import { ListView, RefreshController, RefreshDataSource } from '@abner/refresh'
import { getBannerApi, getHomeArticleListApi, getPopularQAApi, IArticleItem, IBannerItem } from "../api/home"
import { PageUrl } from "../constants/pageUrl"

@HMRouter({ pageUrl:PageUrl.Home })
@ComponentV2
export struct Home {
  @Local page:number = 0;
  @Local bannerList:IBannerItem[] = []
  @Local qaList:IArticleItem[] = []

  controller:RefreshController = new RefreshController();
  dataSource:RefreshDataSource = new RefreshDataSource()
  // @Local bannerList:IBannerItem[] = []
  // @Local bannerList:IBannerItem[] = []

  aboutToAppear(): void {
    this.getBannerList()
    this.getQAList()
    this.getArticleList()
  }
  async getBannerList(){
    const result = await getBannerApi()
    if(result.errorCode === 0) {
      this.bannerList = result.data!
    }
  }

  async getQAList(){
    const result = await getPopularQAApi()
    if(result.errorCode === 0) {
      this.qaList = result.data!
    }
  }

  async getArticleList(){
    const result = await getHomeArticleListApi(this.page)
    if(result.errorCode === 0){
      if(this.page === 0) {
        this.dataSource.initData(result.data!.datas)
      } else {
        this.dataSource.pushDataArray(result.data?.datas)
      }
    }
  }
  build() {
    Column() {
       Swiper(){
         ForEach(this.bannerList,(item:IBannerItem)=>{
            Image(item.imagePath).width($r('app.string.w_full')).height(160)
         })
       }

       Scroll(){
         Column(){
           Text('最受欢迎问答')
           ForEach(this.qaList,(item:IArticleItem)=>{
             Text(item.title)
           })
         }
       }

       ListView({
         lazyDataSource:this.dataSource,
         controller:this.controller,
         itemLayout:(item,index)=> this.itemLayout(item,index),
         onLoadMore:()=>{
           this.page++
           this.getArticleList()
           this.controller.finishLoadMore()
         }
       })
    }.width($r('app.string.w_full')).height($r('app.string.h_full'))
  }

  @Builder
  itemLayout(item:Object,index:number) {
    Row(){
      Column(){
       Text((item as IArticleItem).title)
        Row(){
         Text((item as IArticleItem).author)
          Text((item as IArticleItem).niceDate)
        }
      }
    }
  }
}

