# -*- coding: utf-8 -*-
require 'pp'
class LoginController < ApplicationController
  SALT = 'cloudn'

  def login
    if params[:login_id].present? || params[:password].present?
      if params[:login_id] == 'kiriya'
        password      = params[:password]
        login_id      = params[:login_id]
        password_hash = Digest::SHA256.hexdigest("#{SALT}#{login_id}#{password}")



        # _study_rails_session
        #result = redis.set(login_id, params[:authenticity_token])

        # sessionを作ると、勝手にkeyを払いだされる
        # passwordはやめてtimestanpとかにする
      end
    end
    # エラー
    #redirect_to :action => 'show', :error => 'error'
  end

  def index
    p "///////"
    p session.keys
    p "#######"
    p cookies['_session_id']
    pp session['session_id']

    #redis = Redis.new
    #redis.set(cookies['session_id'], '（・(エ)・）')
    p "///////"
    #reset_session
  end
end
