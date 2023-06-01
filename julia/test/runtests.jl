using EavesPlotStyle

xyRand = rand(30, 3)
xyRandN = randn(30, 3)

plt = eaves_plot()


scale = 12

plt.figure(figsize=(2 * scale, 1 * scale)) ## great for creating a 1 row, 2 column set of subplots

ax = plt.subplot(1, 2, 1)
for i in 1:length(xyRand[1, :])
    ax.plot(xyRand[:, i], c=pynord_palette[i], label="Random Array $i")
end
plt.xlabel("Nth Number")
plt.ylabel("Random Number from rand()")

ax = plt.subplot(1, 2, 2)
for i in 1:length(xyRandN[1, :])
    ax.plot(xyRandN[:, i], c=pynord_palette[i], label="Random Array $i")
end

plt.xlabel("Nth Number")
plt.ylabel("Random Number from randn()")

plt.savefig("2x1_subplot_example.pdf")




using Test

@testset "EavesPlotStyle.jl" begin
    # Write your tests here.
end
