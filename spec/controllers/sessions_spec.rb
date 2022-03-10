it "authenticate member" do
    create(:my_user)
    @request.env["devise.mapping"] = Devise.mappings[:my_user]
    @request.env["warden"] = warden

    ## Added post request to "create"
    post :create, :my_user => FactoryBot.attributes_for(:my_user)
   
    ## Added new expectations
    expect(controller.myuser_signed_in?).to be true
    expect(controller.current_my_user.email).to eq "lp@gmail.com"
 
    ## "session["warden.user.member.key"][0].first" stores the "id" of logged in member
    ## Replace "member" in "session["warden.user.member.key"][0].first" with your
    ## devise model name. For example: If your devise model name is customer then you
    ## need to check "session["warden.user.customer.key"][0].first"
    expect(session["warden.user.my_user.key"][0].first).to eq member.id
end
