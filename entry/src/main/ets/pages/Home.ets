import router from '@ohos.router';
import my from "../view/My"


@Entry
@Preview
@Component
struct Home {
  @State currentIndex: number = 0
  scroller: Scroller = new Scroller()
  private tabsControlIndex: TabsController = new TabsController()
  private swiperController: SwiperController = new SwiperController()
  private swiperData: Array<Object> = [
    { img: $r('app.media.swiper1') },
    { img: $r('app.media.swiper2') },
    { img: $r('app.media.swiper3') },
    { img: $r('app.media.swiper4') },
  ]
  private girdDatas: Array<Object> = [
    { img: $r('app.media.icon'), title: '我的最爱' },
    { img: $r('app.media.icon'), title: '历史记录' },
    { img: $r('app.media.icon'), title: '消息' },
    { img: $r('app.media.icon'), title: '购物车' },
    { img: $r('app.media.icon'), title: '我的目标' },
    { img: $r('app.media.icon'), title: '圈子' },
    { img: $r('app.media.icon'), title: '收藏' },
    { img: $r('app.media.icon'), title: '回收站' },
    { img: $r('app.media.icon'), title: '数据' },
    { img: $r('app.media.icon'), title: '足迹' },
  ]

  @Builder tabItem(normalImg: Resource, selectImg: Resource, text: string, targetIndex: number) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectImg : normalImg)
        .size({ height: 32, width: 32 })
      Text(text)
        .fontColor(this.currentIndex === targetIndex ? "#1296db" : "#6B6B6B")
        .fontSize(14)
    }
    .width("100%")
    .height(60)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsControlIndex.changeIndex(this.currentIndex)
    })
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.tabsControlIndex }) {
        TabContent() {
          Scroll(this.scroller) {
            Column() {
              Text('首页')
                .margin({ top: 40 })
                .fontSize(24)
                .fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Start)
                .width("100%")
              Swiper(this.swiperController) {
                ForEach(this.swiperData, (item) => {
                  Image(item.img).objectFit(ImageFit.Fill)
                }, (item) => JSON.stringify(item))
              }
              .margin({ top: 20 })
              .width('100%')
              .height(160)
              .autoPlay(true)
              .interval(4000)
              .duration(1000)
              .borderRadius(10)


              Grid() {
                ForEach(this.girdDatas, (item) => {
                  GridItem() {
                    Column() {
                      Image(item.img).width(48).height(48).margin({ top: 10 })
                      Text(item.title).margin({ top: 10, bottom: 10 })
                    }
                  }
                }, item => JSON.stringify(item))
              }
              .columnsTemplate('1fr 1fr 1fr 1fr')
              .columnsGap(8)
              .rowsGap(12)
              .height(204)
              .margin({ top: 20 })
              .backgroundColor(Color.White)
              .borderRadius(10)

              Text('列表')
                .margin({ top: 20 })
                .fontSize(18)
                .textAlign(TextAlign.Start)
                .width("100%")

              Grid() {
                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Green)

                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Red)
                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Green)

                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Red)
              }
              .columnsTemplate('1fr 1fr')
              .columnsGap(8)
              .rowsGap(8)
              .height(500)
              Text('列表')
                .margin({ top: 20 })
                .fontSize(18)
                .textAlign(TextAlign.Start)
                .width("100%")

              Grid() {
                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Green)

                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Red)
                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Green)

                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Red)
              }
              .columnsTemplate('1fr 1fr')
              .columnsGap(8)
              .rowsGap(8)
              .height(500)
              Text('列表')
                .margin({ top: 20 })
                .fontSize(18)
                .textAlign(TextAlign.Start)
                .width("100%")

              Grid() {
                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Green)

                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Red)
                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Green)

                GridItem() {

                }.width(140).height(140).backgroundColor(Color.Red)
              }
              .columnsTemplate('1fr 1fr')
              .columnsGap(8)
              .rowsGap(8)
              .height(500)

            }
            .width("100%")
            .height("100%")
            .backgroundColor("#ffe3e3e3")
            .padding({ left: 20, right: 20 })
          }
          .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
          .scrollBar(BarState.On) // 滚动条常驻显示
          .scrollBarColor(Color.Gray) // 滚动条颜色
          .scrollBarWidth(10) // 滚动条宽度
          .edgeEffect(EdgeEffect.None)
        }
        .tabBar(this.tabItem($r('app.media.Home'), $r('app.media.selectHome'), '首页', 0))

        TabContent() {
          Column() {
            my()
          }
          .width("100%")
          .height("100%")

        }
        .tabBar(this.tabItem($r('app.media.My'), $r('app.media.selectMy'), '我的', 1))
      }
      .vertical(false)
      .barWidth('100%')
      .barHeight(60)

      .onChange((index: number) => {
        this.currentIndex = index
      })

    }
    .width("100%")

  }
}