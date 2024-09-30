import { HMDefaultGlobalAnimator, HMNavigation } from '@hadss/hmrouter';
import { AttributeUpdater } from '@kit.ArkUI';
import { PageUrl } from '../constants/pageUrl';

@Entry
@Component
struct Index {
  modifier: NavModifier = new NavModifier();
  build() {
    Column() {
      HMNavigation({
        navigationId: 'mainNavigation', homePageUrl:PageUrl.Home, options: {
          standardAnimator: HMDefaultGlobalAnimator.STANDARD_ANIMATOR,
          dialogAnimator: HMDefaultGlobalAnimator.DIALOG_ANIMATOR,
          modifier: this.modifier
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}

class NavModifier extends AttributeUpdater<NavigationAttribute> {
  initializeModifier(instance: NavigationAttribute): void {
    instance.mode(NavigationMode.Stack);
    instance.navBarWidth('100%');
    instance.hideTitleBar(true);
    instance.hideToolBar(true);
  }
}
