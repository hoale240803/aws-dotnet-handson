# Stage 1: Base image
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Stage 2: Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy just the project file
COPY ["app/demo.csproj", "app/"]
RUN dotnet restore "app/demo.csproj"

# Copy everything else
COPY . .

# Build (produces files in /app/build)
WORKDIR "/src/app"
RUN dotnet build "demo.csproj" -c Release -o /app/build

# Stage 3: Publish
FROM build AS publish
WORKDIR "/src/app"
RUN dotnet publish "demo.csproj" -c Release -o /app/publish

# Stage 4: Final image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "demo.dll"]
