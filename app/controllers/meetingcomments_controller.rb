class MeetingcommentsController < ApplicationController
  def create
    @meeting = Meeting.find(params[:meeting_id])
    @meetingcomment = @meeting.meetingcomments.create(meetingcomment_params)
    @meetingcomment.user = current_user
    
    if @meetingcomment.save
      redirect_to @meeting
    else
      render 'meeting/show'
    end
  end

  private

  def meetingcomment_params
    params.require(:meetingcomment).permit(:content)
  end
end
