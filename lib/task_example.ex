defmodule TaskExample do

    def db_update do
        "DB update result"
    end

    def send_email do
        {:ok, "Email has been sent!"}
    end

    def notify_remote_api do
        {:ok, "Notification has been sent."}
    end
end
# iex(1)> db_query = Task.async(fn -> TaskExample.db_update end)
# %Task{
#   owner: #PID<0.120.0>,
#   pid: #PID<0.122.0>,
#   ref: #Reference<0.4289291883.658767873.41978>
# }
# //
# iex(5)> db_result = Task.await(db_query)
# "DB update result"
#  work in pairs
# <------- Just execute. For instance, in background ------>
# iex(1)> Task.start(fn ->
# ...(1)> {:ok, response} = TaskExample.notify_remote_api
# ...(1)> IO.puts response
# ...(1)> end)
# Notification has been sent.
# {:ok, #PID<0.124.0>}
