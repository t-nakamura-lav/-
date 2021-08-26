require 'rails_helper'

describe '投稿のテスト' do
  let!(:user) { create(:user) }
  let!(:tweet) { create(:tweet, challenge: 'hoge', tweet: 'body', user: user) }

  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end

    context '表示の確認' do
      it 'トップ画面(root_path)に「ここはTopページです」が表示されているか' do
        expect(page).to have_content 'ログイン'
      end
      it 'root_pathが"/top"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end

  describe "きろく画面(new_tweet_path)のテスト" do
    before do
      visit new_tweet_path
    end

    context '表示の確認' do
      it 'new_tweet_pathが"/tweets/new"であるか' do
        expect(current_path).to eq('/tweets/new')
      end
      it '保存ボタンが表示されているか' do
        expect(page).to have_button '保存'
      end
    end

    context 'きろく投稿処理のテスト' do
      it 'きろく投稿後のリダイレクト先は正しいか' do
        fill_in 'tweet[challenge]', with: Faker::Lorem.characters(number: 5)
        fill_in 'tweet[tweet]', with: Faker::Lorem.characters(number: 20)
        click_button '保存'
        expect(page).to have_current_path complete_tweets_path
      end
    end
  end

  describe "みんなのがんばり一覧のテスト" do
    before do
      visit tweets_path
    end

    context '表示の確認' do
      it '投稿されたものが表示されているか' do
        expect(page).to have_content tweet.challenge
        expect(page).to have_content tweet.tweet
      end
    end
  end

  describe "がんばったこと詳細画面のテスト" do
    before do
      visit tweet_path(tweet)
    end

    context '表示の確認' do
      it '削除リンクが存在しているか' do
        expect(page).to have_link '削除'
      end
      it '編集リンクが存在しているか' do
        expect(page).to have_link '編集'
      end
    end

    context 'リンクの遷移先の確認' do
      it '編集の遷移先は編集画面か' do
        edit_link = find_all('a')[3]
        edit_link.click
        # expect(current_path).to eq('/tweets/' + tweet.id.to_s + '/edit')
        expect(page).to have_current_path edit_tweet_path(tweet)
      end
    end

    context 'tweet削除のテスト' do
      it 'tweetの削除' do
        expect { tweet.destroy }.to change(Tweet, :count).by(-1)
      end
    end
  end

  describe '編集画面のテスト' do
    before do
      visit edit_tweet_path(tweet)
    end

    context '表示の確認' do
      it '編集前のタイトルと本文がフォームに表示(セット)されている' do
        expect(page).to have_field 'tweet[challenge]', with: tweet.challenge
        expect(page).to have_field 'tweet[tweet]', with: tweet.tweet
      end
      it '保存ボタンが表示される' do
        expect(page).to have_button '保存'
      end
    end

    context '更新処理に関するテスト' do
      it '更新後のリダイレクト先は正しいか' do
        fill_in 'tweet[challenge]', with: Faker::Lorem.characters(number: 5)
        fill_in 'tweet[tweet]', with: Faker::Lorem.characters(number: 20)
        click_button '保存'
        expect(page).to have_current_path tweet_path(tweet)
      end
    end
  end
end
