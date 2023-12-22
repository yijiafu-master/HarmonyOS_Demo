import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

@Entry
@Preview
@Component
struct Login {
  @State isShow: boolean = false
  private userName: string = ""
  private password: string = ""

  @Builder imgButton(src: Resource, text: string, PositionTop: number) {
    Column() {
      Button({ type: ButtonType.Circle, stateEffect: true }) {
        Image(src)
          .backgroundImagePosition(Alignment.Center)
      }
      .width($r('app.float.login_otherImage_width'))
      .height($r('app.float.login_otherImage_height'))
      .backgroundColor(Color.White)

      Row() {
        Text(text)
          .margin({ top: PositionTop })
      }
    }

  }

  login() {
    this.isShow = true
    if (this.userName === '13211111111' && this.password === '111111') {
      setTimeout(() => {
        this.isShow = false
        router.replaceUrl({
          url: "pages/Home"
        })
      }, 2000)
    }
    else if (this.userName !== '13211111111') {
      this.isShow = false
      promptAction.showToast({
        message: '账号错误',
        duration: 2000
      })
    }
    else if (this.password !== '111111') {
      this.isShow = false
      promptAction.showToast({
        message: '密码错误',
        duration: 2000
      })
    }

  }

  build() {
    Row() {
      Column() {

        Image($r("app.media.app_icon"))
          .width(78)
          .margin({ top: 60 })

        Text($r('app.string.login_text'))
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 30, bottom: 10 })

        Text($r('app.string.login_desc'))
          .fontSize(20)
          .fontColor("#BEBEBE")
          .margin({ bottom: 70 })

        TextInput({ placeholder: $r('app.string.input_placeholder') })
          .width($r('app.float.login_input_width'))
          .height($r('app.float.login_input_height'))
          .maxLength(11)
          .type(InputType.Number)
          .margin({ bottom: 20 })
          .onChange((val: string) => {
            this.userName = val
          })

        TextInput({ placeholder: $r('app.string.input_pwd_placeholder') })
          .width($r('app.float.login_input_width'))
          .height($r('app.float.login_input_height'))
          .type(InputType.Password)
          .onChange((val: string) => {
            this.password = val
          })

        Row() {
          Text($r('app.string.login_iphone'))
            .fontColor("#ff479ce7")
            .margin({ top: 16, left: 6 })
          Text($r('app.string.login_pwd'))
            .fontColor("#ff479ce7")
            .margin({ top: 16, right: 6 })
        }
        .width(300)
        .justifyContent(FlexAlign.SpaceBetween)

        Button($r('app.string.login_btn_text'))
          .width($r('app.float.login_btn_width'))
          .height($r('app.float.login_input_height'))
          .fontSize($r('app.float.login_btn_size'))
          .type(ButtonType.Capsule)
          .stateEffect(true)
          .margin({ top: 20 })
          .onClick(() => {
            if (!this.userName) {
              promptAction.showToast({
                message: '请输入账号',
                duration: 2000,
              });
            }
            else if (!this.password) {
              promptAction.showToast({
                message: '请输入密码',
                duration: 2000,
              });
            }
            else {
              this.login()
            }

          })

        Text($r('app.string.login_resister'))
          .fontColor("#ff479ce7")
          .margin({ top: 10 })
          .fontSize(18)
          .onClick(() => {
            router.pushUrl({
              url: 'view/Resister'
            })
          })
        Row() {
          if (this.isShow) {
            LoadingProgress()
              .width(50)
              .height(50)
              .color("#ff479ce7")
              .visibility(this.isShow ? Visibility.Visible : Visibility.Hidden)
          }
        }.height(50)

        Text('第三方登录')
          .margin({ top: 30, bottom: 10 })
          .fontSize(20)
        Divider().height(2).color($r('app.color.driver_color'))
        Row() {
          this.imgButton($r('app.media.QQ'), 'QQ', 10)
          this.imgButton($r('app.media.weixin'), '微信', 10)
          this.imgButton($r('app.media.douyin'), '抖音', 10)
        }

        .width(300)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ top: 20 })

      }
      .width('100%')
    }
  }
}