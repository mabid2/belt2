class GroupController < ApplicationController
  def create
    @group = Group.create(user_id: current_user.id, name: params[:name], description: params[:description])
    @member = Member.create(user_id: current_user.id ,group_id: @group.id, number: 1)
    if !@group.valid?
      flash[:errors_org] = @group.errors.full_messages
      redirect_to '/user'
    else
      redirect_to '/user'
    end
  end
  def delete
    Group.find(params[:group_id]).delete
    redirect_to '/user'
  end
  def show
    @group = Group.find_by_id(params[:id])
    @members = Member.where(group_id: params[:id])
  end
  def add
    @numb = Member.where(user_id: current_user.id).count
    @numb = @numb + 1
    @member = Member.create(user_id: current_user.id ,group_id: params[:id], number: @numb)
    redirect_to '/group/'+ params[:id].to_s
  end
  def update
    @numb = Member.where(user_id: current_user.id, group_id: params[:id]).first.number
    @numb = @numb - 1
    @member = Member.where(user_id: current_user.id, group_id: params[:id]).first.update(number: @numb)
    redirect_to '/group/'+ params[:id].to_s
  end
end
