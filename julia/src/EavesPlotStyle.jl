module EavesPlotStyle
using PythonPlot
import Plots.RGB, Plots.cgrad, Plots.@colorant_str

export eaves_plot
export KS_palette, KS_gradient
export nord_palette, nord_gradient

"""
    eaves_plot_style()


"""
function eaves_plot_style()
    p = PythonPlot.matplotlib

    p.rcParams["font.sans-serif"] = "Arial"

    p.rcParams["axes.spines.left"] = true
    p.rcParams["axes.spines.bottom"] = true
    p.rcParams["axes.spines.right"] = true
    p.rcParams["axes.spines.top"] = true
    p.rcParams["axes.titlepad"] = 25
    p.rcParams["axes.linewidth"] = 8.0


    p.rcParams["xtick.labelsize"] = 40
    p.rcParams["xtick.major.size"] = 30 * 0.5
    p.rcParams["xtick.major.width"] = 8
    p.rcParams["xtick.major.pad"] = 15
    p.rcParams["xtick.direction"] = "in"

    p.rcParams["xtick.minor.size"] = 0.0
    p.rcParams["xtick.minor.width"] = 2
    p.rcParams["xtick.minor.pad"] = 15
    p.rcParams["xtick.direction"] = "in"

    p.rcParams["ytick.labelsize"] = 40
    p.rcParams["ytick.major.size"] = 30 * 0.5
    p.rcParams["ytick.major.width"] = 8
    p.rcParams["ytick.major.pad"] = 15
    p.rcParams["ytick.direction"] = "in"

    p.rcParams["ytick.minor.size"] = 0.0
    p.rcParams["ytick.minor.width"] = 2
    p.rcParams["ytick.minor.pad"] = 15
    p.rcParams["ytick.direction"] = "in"

    p.rcParams["lines.linewidth"] = 8.0

    # p.rcParams["image.aspect"] = 1.618
    # p.rcParams["figure.dpi"] = 300
    # p.rcParams["figure.figsize"] = [3,2]
    return nothing
end

function eaves_plot()
    eaves_plot_style()
    return PythonPlot.matplotlib.pyplot
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

global KS_gradient = cgrad(KS_palette, 0:1/11:1.0, alpha=nothing, rev=false, scale=nothing, categorical=nothing)

global nord_palette = [
    colorant"#5E81AC",
    colorant"#BF616A",
    colorant"#EBCB8B",
    colorant"#A3BE8C",
    colorant"#B48EAD",
    colorant"#D08770"
]

global nord_gradient = cgrad(nord_palette, 0:1/11:1.0, alpha=nothing, rev=false, scale=nothing, categorical=nothing)

end
