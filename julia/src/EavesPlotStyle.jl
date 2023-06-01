module EavesPlotStyle
using PythonPlot
import Plots.RGB, Plots.cgrad, Plots.@colorant_str

export eaves_plot, create_panel
export KS_palette, pyKS_palette, KS_gradient
export nord_palette, pynord_palette, nord_gradient

"""
    eaves_plot_style()


"""
function eaves_plot_style()
    p = PythonPlot.matplotlib

    p.rcParams["font.sans-serif"] = "Arial"
    p.rcParams["font.size"] = 35
    # p.rcParams["figure.labelsize"] = 40
    # p.rcParams["figure.titlesize"] = 60

    p.rcParams["axes.spines.left"] = true
    p.rcParams["axes.spines.bottom"] = true
    p.rcParams["axes.spines.right"] = true
    p.rcParams["axes.spines.top"] = true
    p.rcParams["axes.titlepad"] = 20
    p.rcParams["axes.linewidth"] = 6.0
    # p.rcParams["axes.labelsize"] = 50


    p.rcParams["xtick.labelsize"] = 30
    p.rcParams["xtick.major.size"] = 30 * 0.5
    p.rcParams["xtick.major.width"] = 8
    p.rcParams["xtick.major.pad"] = 12
    p.rcParams["xtick.direction"] = "in"

    p.rcParams["xtick.minor.size"] = 0.0
    p.rcParams["xtick.minor.width"] = 2
    p.rcParams["xtick.minor.pad"] = 15
    p.rcParams["xtick.direction"] = "in"

    p.rcParams["ytick.labelsize"] = 30
    p.rcParams["ytick.major.size"] = 30 * 0.5
    p.rcParams["ytick.major.width"] = 8
    p.rcParams["ytick.major.pad"] = 12
    p.rcParams["ytick.direction"] = "in"

    p.rcParams["ytick.minor.size"] = 0.0
    p.rcParams["ytick.minor.width"] = 2
    p.rcParams["ytick.minor.pad"] = 15
    p.rcParams["ytick.direction"] = "in"

    p.rcParams["lines.linewidth"] = 6.0

    # p.rcParams["figure.autolayout"] = true
    p.rcParams["figure.constrained_layout.use"] = true
    # p.rcParams["figure.subplot.left"] = 0.5
    # p.rcParams["figure.subplot.right"] = 0.95
    # p.rcParams["figure.constrained_layout.wspace"] = 0.1
    # p.rcParams["figure.constrained_layout.hspace"] = 0.1

    # p.rcParams["image.aspect"] = 1.618
    # p.rcParams["figure.dpi"] = 300
    # p.rcParams["figure.figsize"] = [3,2]
    return nothing
end

function eaves_plot()
    eaves_plot_style()
    return PythonPlot.matplotlib.pyplot
end

function create_panel(width, height, scale, xlabels, ylabels)
    plt = eaves_plot()
    plt.figure(figsize=(width * scale, height * scale)) ## great for creating a 1 row, 2 column set of subplots
    ax = []
    k = 1
    for i in 1:height
        axRow = []
        for j in 1:width
            push!(axRow, plt.subplot(height, width, k))

            plt.xlabel(xlabels[k])
            plt.ylabel(ylabels[k])

            k += 1
        end
        push!(ax, axRow)
    end
    return plt, ax
end

global KS_palette = [
    RGB(25 / 255, 65 / 255, 87 / 255),
    RGB(45 / 255, 92 / 255, 136 / 255),
    RGB(81 / 255, 148 / 255, 153 / 255),
    RGB(134 / 255, 199 / 255, 186 / 255),
    RGB(198 / 255, 229 / 255, 223 / 255),
    RGB(223 / 255, 182 / 255, 84 / 255),
    RGB(210 / 255, 130 / 255, 78 / 255),
    RGB(196 / 255, 69 / 255, 58 / 255),
    RGB(160 / 255, 48 / 255, 35 / 255),
    RGB(98 / 255, 30 / 255, 66 / 255)
]

global pyKS_palette = [(KS_palette[i].r, KS_palette[i].g, KS_palette[i].b) for i in eachindex(KS_palette)]

global KS_gradient = cgrad(KS_palette, 0:1/11:1.0, alpha=nothing, rev=false, scale=nothing, categorical=nothing)

global nord_palette = [
    colorant"#5E81AC",
    colorant"#BF616A",
    colorant"#EBCB8B",
    colorant"#A3BE8C",
    colorant"#B48EAD",
    colorant"#D08770"
]

global pynord_palette = [(nord_palette[i].r, nord_palette[i].g, nord_palette[i].b) for i in eachindex(nord_palette)]


global nord_gradient = cgrad(nord_palette, 0:1/11:1.0, alpha=nothing, rev=false, scale=nothing, categorical=nothing)

end
