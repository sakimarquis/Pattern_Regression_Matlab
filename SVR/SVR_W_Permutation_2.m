
function SVR_W_Permutation_2(Data_Path, Score, Perm_times_Range, ResultantFolder, Queue)

for i = Perm_times_Range
    i
    Job_Name = ['perm_' num2str(i)];
    pipeline.(Job_Name).command = 'W_Calculate_SVR_SGE_2(opt.para1, opt.para2, opt.para3, opt.para4)';
    pipeline.(Job_Name).opt.para1 = Data_Path;
    pipeline.(Job_Name).opt.para2 = Score';
    pipeline.(Job_Name).opt.para3 = i;
    pipeline.(Job_Name).opt.para4 = ResultantFolder;
    
end

Pipeline_opt.mode = 'qsub';
Pipeline_opt.qsub_options = Queue;
Pipeline_opt.mode_pipeline_manager = 'batch';
Pipeline_opt.max_queued = 100;
Pipeline_opt.flag_verbose = 1;
Pipeline_opt.flag_pause = 0;
Pipeline_opt.flag_update = 1;
Pipeline_opt.path_logs = [ResultantFolder filesep 'logs'];

psom_run_pipeline(pipeline,Pipeline_opt);


