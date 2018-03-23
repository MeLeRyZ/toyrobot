defmodule ToyRobot.StatefulRobot do
    # alias ToyRobot.StatefulRobot -> Beacuse of Agent

    def place do
        {:ok, state} = ToyRobot.place
        {:ok, pid} = Agent.start(fn -> state end, name: __MODULE__)
        pid
    end

    #  NO NEED WITH Agent
    # def listen(state) do
    #     receive do
    #         {:report, pid} ->
    #             send(pid, state)
    #             listen(state)
    #         {:move} -> ToyRobot.move(state) |> listen
    #         {:left} -> ToyRobot.left(state) |> listen
    #         {:right} -> ToyRobot.right(state) |> listen
    #     end
    # end

    def move, do: Agent.update(__MODULE__, &(ToyRobot.move(&1)))
    def left, do: Agent.update(__MODULE__, &(ToyRobot.left(&1)))
    def right, do: Agent.update(__MODULE__, &(ToyRobot.right(&1)))

    def report do
        Agent.get(__MODULE__, &(ToyRobot.report(&1))) #EQUALS " fn state -> ToyRobot.report(state) end "
    end
    # def report do
    #     send(StatefulRobot, {:report, self()})
    #
    #     receive do
    #         state -> ToyRobot.report(state)
    #     end
    # end
end
