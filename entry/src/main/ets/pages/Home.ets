import router from '@ohos.router';
import my from "../view/My"

@Entry
@Preview
@Component
struct Home {
  @State currentIndex: number = 0
  private tabsControlIndex: TabsController = new TabsController()

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
          Column() {
            Text('首页内容')
          }
          .width("100%")
          .height("100%")
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