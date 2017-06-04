import { RoutermailPage } from './app.po';

describe('routermail App', () => {
  let page: RoutermailPage;

  beforeEach(() => {
    page = new RoutermailPage();
  });

  it('should display welcome message', done => {
    page.navigateTo();
    page.getParagraphText()
      .then(msg => expect(msg).toEqual('Welcome to app!!'))
      .then(done, done.fail);
  });
});
