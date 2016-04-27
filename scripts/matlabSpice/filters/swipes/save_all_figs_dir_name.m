function save_all_figs_dir_name(dirName)
    cd(dirName);
    figHandles = get(0,'Children');
        for f = figHandles'
            text=f.Name;
            %text = regexprep(text, '.1-DC.2d_datDrop', '_drop');
            text = regexprep(text, '.1-DC.2d_dat*', '');
            text = regexprep(text, '_', '-');
            text = regexprep(text, '\.', 'p');
            saveas(f,text,'fig');
        end
cd ('../');
end

