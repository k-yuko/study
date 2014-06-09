# -*- coding: utf-8 -*-
require 'pp'
class LoginController < ApplicationController
  SALT = 'cloudn'

  def login
    if params[:login_id].present? || params[:password].present?
      if params[:login_id] == 'kuma'
        password      = params[:password]
        login_id      = params[:login_id]
        password_hash = Digest::SHA256.hexdigest("#{SALT}#{login_id}#{password}")

      end
    end
    # エラー
    #redirect_to :action => 'login', :error => 'error'
  end

  def index
    if session['login_id'].blank?
      session['login_id'] = params[:login_id]
    end
    #reset_session
  end

  def encode(val)
    Marshal.dump val
  end

  def decode(val)
    Marshal.load val
  end
end
