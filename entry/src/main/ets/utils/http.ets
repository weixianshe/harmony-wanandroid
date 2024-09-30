import axios, { AxiosResponse } from '@ohos/axios'
import { ApiUrl } from '../constants/api'

interface IBaseOn <T>{
  data?:T;
  errorCode:number;
  errorMessage:string;
}
const http = axios.create({
  baseURL:ApiUrl.BASE_URL,
  timeout: 10 * 1000
})

http.interceptors.response.use((response:AxiosResponse)=>{
   return response.data
})

function httpGet<T>(path:string):Promise<IBaseOn<T>>{
  return http.get(path)
}

function httpPost<T,D>(path:string, data?:D):Promise<IBaseOn<T>> {
  return http.post(path,data)
}

export {
  httpGet,
  httpPost
}