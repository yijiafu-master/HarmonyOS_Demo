import router from '@ohos.router'
@Entry
@Component
@Preview
export default struct My {
  private value: string = 'Hello Word'
  private listData: Array<Object> = [
    { img: $r('app.media.icon'), text: '测试1', others: true },
    { img: $r('app.media.icon'), text: '测试2', others: false },
    { img: $r('app.media.icon'), text: '测试3', others: false },
    { img: $r('app.media.icon'), text: '测试4', others: false },
    { img: $r('app.media.icon'), text: '测试5', others: false },
    { img: $r('app.media.icon'), text: '测试6', others: false },
    { img: $r('app.media.icon'), text: '测试7', others: false },
  ]

  @Builder listCell(img: Resource, text: string, others: boolean) {
    Row() {
      Row() {
        Image(img).width(26).height(26).margin({ left: 10, right: 10 })
        Text(text)
      }

      Row() {
        if (others === false) {
          Image($r('app.media.right')).width(24).height(24)
        }
        else {
          Toggle({ type: ToggleType.Switch, isOn: false }).size({ width: 38, height: 28 })
        }
      }.margin({ right: 10 })
    }
    .width(340)
    .height(40)
    .backgroundColor(Color.White)
    .margin({ left: 20, top: 10 })
    .borderRadius(10)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column() {
      Text('我的')
        .margin({ top: 40 })
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width("100%")
        .margin({ left: 30, top: 20 })
      Row() {
        Row() {
          Image($r("app.media.icon"))
            .width(60).height(60).margin({ left: 20 })
          Column() {
            Row() {
              Text('李先生')
            }
            .margin({ bottom: 6 })

            Row() {
              Text('xxxx@qq.com')
            }
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 10 })
        }

        Row() {
          QRCode(this.value).width(60).height(60)
        }
        .margin({ right: 20 })

      }
      .height(140)
      .width(340)
      .backgroundColor(Color.White)
      .borderRadius(10)
      .margin({ top: 20 })
      .justifyContent(FlexAlign.SpaceBetween)

      List() {
        ForEach(this.listData, (item) => {
          this.listCell(item.img, item.text, item.others)
        }, item => JSON.stringify(item))
      }
      .margin({ top: 20 })

      Button('退出登录')
        .width(340)
        .height(40)
        .backgroundColor(Color.White)
        .fontColor(Color.Red)
        .type(ButtonType.Normal)
        .borderRadius(10)
        .margin({top:100})
        .onClick(()=>{
          router.pushUrl({
            url:"view/Login"
          })
        })
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#ffe3e3e3")
  }
}
