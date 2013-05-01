require 'test_helper'

class WorkFlowTest< FeatureTest

  it 'seeing an empty inbox' do
    visit "/discuss/mailbox/inbox" # discuss.mailbox_path(:inbox)
    assert page.has_content?('Inbox')
    assert page.has_content?('0 messages')
  end

  context 'with messages' do
    before do
      @message = @sender.messages.create(body: 'lorem ipsum', recipients: [@recipient])
      @message.send!
      @outbox = Discuss::Mailbox.new(@sender).outbox
      assert_equal 1, @outbox.count
    end

    it 'sees an outbox' do
      visit '/discuss/mailbox/outbox'
      #print page.html
      assert page.has_content?('1 message')
      within '.messages' do
        assert page.has_content?(@recipient.to_s)
      end
    end

    it 'sees drafts' do
      @draft = @sender.messages.create(body: 'only for me eyes', recipients: [@lisa])
      visit '/discuss/mailbox/drafts'
      assert page.has_content?('Drafts')
      #print page.html
      within '.messages' do
        assert page.has_content?(@draft.body)
        assert page.has_content?(@lisa.to_s)
      end

    end
  end
end

