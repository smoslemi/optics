function save_all_figs_to_dir(dir_name)
figlist=findobj('type','figure');
    for i=1:numel(figlist)
    figlist(i);
    filename = strcat('fig',num2str(i),'.jpg');
    f= fullfile(dir_name, filename);
    saveas(figlist(i),f);
    filename2 = strcat('fig',num2str(i),'.fig');
    f2= fullfile(dir_name, filename2);
    saveas(figlist(i),f2);
    %saveas(figlist(i),fullfile(dir_name, filename));
    end
end