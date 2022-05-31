# @param {String[]} logs
# @return {String[]}
def reorder_log_files(logs)
  num_logs = []
  str_logs = []
  logs.each do |log|
    if /\d/.match?(log[-1])
      num_logs << log
    else
      str_logs << log
    end
  end

  str_logs.sort_by! { |log| [ log.split[1..-1].join(' '), log.split[0] ] }
  str_logs + num_logs

end
