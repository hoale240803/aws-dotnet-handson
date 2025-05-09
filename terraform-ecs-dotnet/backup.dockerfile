# # Stage 1: Base image for runtime
# FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
# WORKDIR /app
# EXPOSE 80
# EXPOSE 443

# # Stage 2: Build image
# FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
# WORKDIR /src

# # Copy just the project file and restore dependencies (cache layer)
# COPY ["app/demo.csproj", "app/"]
# RUN dotnet restore "app/demo.csproj"

# # Copy everything else and build
# COPY . .
# WORKDIR "/src/app"
# RUN dotnet build "demo.csproj" -c Release --no-restore -o /app/build

# # Stage 3: Publish
# FROM build AS publish
# RUN dotnet publish "demo.csproj" -c Release --no-restore --no-build -o /app/publish

# # Stage 4: Final runtime image
# FROM base AS final
# WORKDIR /app
# COPY --from=publish /app/publish .
# ENTRYPOINT ["dotnet", "demo.dll"]
