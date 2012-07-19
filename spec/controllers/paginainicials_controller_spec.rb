require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PaginainicialsController do

  # This should return the minimal set of attributes required to create a valid
  # Paginainicial. As you add validations to Paginainicial, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PaginainicialsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all paginainicials as @paginainicials" do
      paginainicial = Paginainicial.create! valid_attributes
      get :index, {}, valid_session
      assigns(:paginainicials).should eq([paginainicial])
    end
  end

  describe "GET show" do
    it "assigns the requested paginainicial as @paginainicial" do
      paginainicial = Paginainicial.create! valid_attributes
      get :show, {:id => paginainicial.to_param}, valid_session
      assigns(:paginainicial).should eq(paginainicial)
    end
  end

  describe "GET new" do
    it "assigns a new paginainicial as @paginainicial" do
      get :new, {}, valid_session
      assigns(:paginainicial).should be_a_new(Paginainicial)
    end
  end

  describe "GET edit" do
    it "assigns the requested paginainicial as @paginainicial" do
      paginainicial = Paginainicial.create! valid_attributes
      get :edit, {:id => paginainicial.to_param}, valid_session
      assigns(:paginainicial).should eq(paginainicial)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Paginainicial" do
        expect {
          post :create, {:paginainicial => valid_attributes}, valid_session
        }.to change(Paginainicial, :count).by(1)
      end

      it "assigns a newly created paginainicial as @paginainicial" do
        post :create, {:paginainicial => valid_attributes}, valid_session
        assigns(:paginainicial).should be_a(Paginainicial)
        assigns(:paginainicial).should be_persisted
      end

      it "redirects to the created paginainicial" do
        post :create, {:paginainicial => valid_attributes}, valid_session
        response.should redirect_to(Paginainicial.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved paginainicial as @paginainicial" do
        # Trigger the behavior that occurs when invalid params are submitted
        Paginainicial.any_instance.stub(:save).and_return(false)
        post :create, {:paginainicial => {}}, valid_session
        assigns(:paginainicial).should be_a_new(Paginainicial)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Paginainicial.any_instance.stub(:save).and_return(false)
        post :create, {:paginainicial => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested paginainicial" do
        paginainicial = Paginainicial.create! valid_attributes
        # Assuming there are no other paginainicials in the database, this
        # specifies that the Paginainicial created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Paginainicial.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => paginainicial.to_param, :paginainicial => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested paginainicial as @paginainicial" do
        paginainicial = Paginainicial.create! valid_attributes
        put :update, {:id => paginainicial.to_param, :paginainicial => valid_attributes}, valid_session
        assigns(:paginainicial).should eq(paginainicial)
      end

      it "redirects to the paginainicial" do
        paginainicial = Paginainicial.create! valid_attributes
        put :update, {:id => paginainicial.to_param, :paginainicial => valid_attributes}, valid_session
        response.should redirect_to(paginainicial)
      end
    end

    describe "with invalid params" do
      it "assigns the paginainicial as @paginainicial" do
        paginainicial = Paginainicial.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Paginainicial.any_instance.stub(:save).and_return(false)
        put :update, {:id => paginainicial.to_param, :paginainicial => {}}, valid_session
        assigns(:paginainicial).should eq(paginainicial)
      end

      it "re-renders the 'edit' template" do
        paginainicial = Paginainicial.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Paginainicial.any_instance.stub(:save).and_return(false)
        put :update, {:id => paginainicial.to_param, :paginainicial => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested paginainicial" do
      paginainicial = Paginainicial.create! valid_attributes
      expect {
        delete :destroy, {:id => paginainicial.to_param}, valid_session
      }.to change(Paginainicial, :count).by(-1)
    end

    it "redirects to the paginainicials list" do
      paginainicial = Paginainicial.create! valid_attributes
      delete :destroy, {:id => paginainicial.to_param}, valid_session
      response.should redirect_to(paginainicials_url)
    end
  end

end
