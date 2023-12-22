import router from '@ohos.router';

@Entry
@Preview
@Component
struct Resister {
  build() {
    Column() {
      Text('注册页面')
      Button('返回')
        .onClick(() => {
          router.back()
        })
    }

  }
}