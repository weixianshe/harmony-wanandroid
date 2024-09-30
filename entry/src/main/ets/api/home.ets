import { ApiUrl } from '../constants/api'
import { httpGet } from '../utils/http'

export interface ITageItem {
  name:string;
  url:string
}
export interface IBannerItem {
  desc: string
  id: number
  imagePath: string
  isVisible: number
  order: number
  title: string
  type: number
  url: string
}

export interface IArticleItem {
  adminAdd: boolean
  apkLink: string
  audit: number
  author: string
  canEdit: boolean
  chapterId: number
  chapterName: string
  collect: boolean
  courseId: number
  desc: string
  descMd: string
  envelopePic: string
  fresh: boolean
  host: string
  id: number
  isAdminAdd: boolean
  link: string
  niceDate: string
  niceShareDate: string
  origin: string
  prefix: string
  projectLink: string
  publishTime: number
  realSuperChapterId: number
  selfVisible: number
  shareDate: number
  shareUser: string
  superChapterId: number
  superChapterName: string
  tags: ITageItem[]
  title: string
  type: number
  userId: number
  visible: number
  zan: number
}

export interface IArticleList {
  curPage:number;
  datas:IArticleItem[];
  offset:number;
  over:boolean;
  pageCount:number;
  size:number;
  total:number
}

const getBannerApi = ()=>{
  return httpGet<IBannerItem[]>(ApiUrl.BANNER_PATH)
}

const getPopularQAApi = ()=>{
  return httpGet<IArticleItem[]>(ApiUrl.POPULAR_QA_PATH)
}

const getHomeArticleListApi = (page:number)=>{
  return httpGet<IArticleList>(`${ApiUrl.HOME_ARTICLE_PATH}/${page}/json`)
}
export {
  getBannerApi,
  getPopularQAApi,
  getHomeArticleListApi
}