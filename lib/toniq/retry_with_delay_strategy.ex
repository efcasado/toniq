defmodule Toniq.RetryWithDelayStrategy do
  @moduledoc """
  The simplest retry strategy:
  - Retries 60 times after the initial try for a total of 61 runs
  - Waits for 250ms before retrying
  That is, a job remains in the queue for up to 15 minutes. After this time
  and if the job has not yet suceeded, it gets moved to the failed jobs
  queue
  """

  def retry?(attempt) when attempt <= 60, do: true
  def retry?(_attempt), do: false

  def ms_to_sleep_before(_attempt), do: 250 # wait 250ms between attempts
end
