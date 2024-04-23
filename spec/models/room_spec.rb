require 'rails_helper'
# テスト実行用
# bundle exec rspec spec/models/room_spec.rb
RSpec.describe Room, type: :model do

  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @user3 = FactoryBot.create(:user)

    @room = FactoryBot.build(:room)

    @room.users << @user1
    @room.users << @user2
    @room.users << @user3
  end

  describe '新規ルーム作成' do
    context '作成できる場合' do
      it 'room_nameとgroup_memoが存在し、userが3人紐づいていれば作成できる' do
        expect(@room).to be_valid
        expect(@room.users.size).to eq 3
      end
      it 'group_memoは空でも作成できる' do
        @room.group_memo = ""
        expect(@room).to be_valid
      end
    end

    context '作成できない場合' do
      it 'room_nameが空では作成できない' do
        @room.room_name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Room name can't be blank")
      end
      it '紐づくユーザーがいなければ作成できない' do
        @room.users.delete(@user2)
        @room.users.delete(@user3)
        @room.valid?
        expect(@room.errors.full_messages).to include("Users must be exactly two users (and you)")
      end
      it '紐づくユーザーがユーザー1だけでは作成できない' do
        @room.users.delete(@user2)
        @room.valid?
        expect(@room.errors.full_messages).to include("Users must be exactly two users (and you)")
      end
      it '紐づくユーザーがユーザー2だけでは作成できない' do
        @room.users.delete(@user3)
        @room.valid?
        expect(@room.errors.full_messages).to include("Users must be exactly two users (and you)")
      end
      it '同じユーザーが選択されていたら保存できない' do
        @room.users.delete(@user3)
        @room.users << @user2
        @room.valid?
        expect(@room.errors.full_messages).to include("Users can't have duplicate members")
      end
    end
  end


end
